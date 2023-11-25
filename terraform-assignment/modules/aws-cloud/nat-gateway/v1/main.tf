resource "aws_nat_gateway" "main" {
  for_each          = local.natgateway_block
  subnet_id         = each.value.subnet_id
  allocation_id     = each.value.allocation_id
  connectivity_type = each.value.connectivity_type
  tags              = each.value.tags
}
