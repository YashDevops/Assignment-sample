resource "aws_eip" "eip" {
   for_each  = local.eip_block
   vpc = each.value.vpc
   tags = each.value.tags
}
