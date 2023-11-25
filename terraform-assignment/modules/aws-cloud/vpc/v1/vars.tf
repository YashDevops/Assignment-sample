variable "vpc_details" {
  description = "This variable used to gather all the requriment of VPC"
  type = map(object({
    cidr_block   = string
    Name = string
    instance_tenancy = optional(string)
    prefix = optional(string)
    tags = map(string)
    enable_dns_hostnames = optional(bool)
    enable_dns_support = optional(bool)
    })
  )
  validation {
    condition = alltrue([
      for element in var.vpc_details : can(regex("^(default|deciated|host)$", element.instance_tenancy)) == true 
    ])
    error_message = "Tenacy can be only default decidated host."
  }
}