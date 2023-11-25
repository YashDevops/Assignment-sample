locals {
natgateway_block = {    for k, v in var.natgateway_details : k => {
    name = v.Name
    subnet_id = v.subnet_id
    allocation_id = v.allocation_id
    connectivity_type = v.connectivity_type
    tags = merge(v.tags , v.prefix == null ? tomap({ Name: "${v.Name}"}): tomap({ Name: "${v.prefix}-${v.Name}"}))
  }
}
}
