locals {
eip_block = {    for k, v in var.eip_details : k => {
    vpc = v.vpc
    tags = merge(v.tags , v.prefix == null ? tomap({ Name: "${v.Name}"}): tomap({ Name: "${v.prefix}-${v.Name}"}))
  }
}
}