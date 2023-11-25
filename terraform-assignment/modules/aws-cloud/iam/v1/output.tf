output "role_created" {
  description = "Details about the role created"
  value = {
    for k, this in aws_iam_role.this : k => {
      arn = this.arn
    }
  }
}