variable "subnet_details" {
  description = "This variable used to gather all the requriment for subnets"
  type = map(object({
    cidr_block   = string
    Name = string
    availability_zone = string
    prefix = optional(string)
    vpc_id = string
    tags = map(string)
    map_public_ip_on_launch = optional(bool)
    })
  )
}