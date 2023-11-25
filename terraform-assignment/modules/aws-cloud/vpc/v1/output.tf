output "vpc_created" {
  description = "Details of all the VPC created"
  value = {
    for k, v in aws_vpc.main : k => {
      arn                                = v.arn
      id                                 = v.id
      instance_tenancy                   = v.instance_tenancy
      enable_dns_support                 = v.enable_dns_support
      enable_dns_hostnames               = v.enable_dns_hostnames
      main_route_table_id                = v.main_route_table_id
      default_network_acl_id             = v.default_network_acl_id
      default_security_group_id          = v.default_security_group_id
      default_route_table_id             = v.default_route_table_id
      owner_id                           = v.owner_id
      tags_all                           = v.tags_all
    }
  }
}

