resource "aws_security_group" "this" {
  for_each = var.sg_details
  name  = each.value.Name
  description = each.value.sg_description
  vpc_id      = each.value.vpc_id
  ingress = each.value.ingress
  egress = each.value.egress
  tags = each.value.tags
}
