output "natgateway_created" {
  description = "Details of all the VPC created"
  value = {
    for k, v in aws_nat_gateway.main : k => {
      id             = v.id
      allocation_id  = v.allocation_id
      subnet_id      = v.subnet_id
      network_interface_id = v.network_interface_id
      private_ip  = v.private_ip
      public_ip   = v.public_ip
      tags_all    = v.tags_all
    }
  }
}