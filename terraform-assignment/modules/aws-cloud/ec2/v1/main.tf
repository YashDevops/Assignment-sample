resource "aws_instance" "ec2_instances" {
  for_each = var.instance_configurations

  ami                    = each.value.ami
  instance_type          = each.value.instance_type
  user_data              = each.value.user_data

  tags =  each.value.tags
}