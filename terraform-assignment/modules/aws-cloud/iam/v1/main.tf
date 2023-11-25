resource "aws_iam_role" "this" {
    for_each = var.iam_role_details
    name = each.value.name
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
        {
            Action = "sts:AssumeRole"
            Effect = "Allow"
            Sid    = ""
            Principal = {
            Service = "ec2.amazonaws.com"
            }
        },
        ]
    })
    tags = each.value.tags
}

resource "aws_iam_policy" "this" {
    for_each = var.iam_role_details
    name        = each.value.name
    description = "Policy ${each.value.name} has been created using Terraform"
    policy = file("${each.value.policy}")
}

resource "aws_iam_role_policy_attachment" "this" {
    for_each = var.iam_role_details
    policy_arn = aws_iam_policy.this[each.key].arn
    role       = aws_iam_role.this[each.key].name
}
