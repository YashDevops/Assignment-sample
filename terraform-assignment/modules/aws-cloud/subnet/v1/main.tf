resource "aws_subnet" "main" {
  for_each          = local.subnet_block
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone
  vpc_id            = each.value.vpc_id
  map_public_ip_on_launch = each.value.map_public_ip_on_launch
  tags = each.value.tags
}
