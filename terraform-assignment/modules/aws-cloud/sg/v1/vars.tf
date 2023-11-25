variable "sg_details" {
  type = map(object({
   Name = string
   sg_description = optional(string)
   vpc_id = optional(string)
   ingress = list(object({
            description = string
            from_port = number
            to_port = number
            protocol = string
            cidr_blocks = optional(list(string))
            ipv6_cidr_blocks = optional(list(string))
            prefix_list_ids = optional(list(string))
            self = optional(string)
            security_groups = optional(set(string))
          }))
   egress = list(object({
            description = string
            from_port = number
            to_port = number
            protocol = string
            cidr_blocks = optional(list(string))
            ipv6_cidr_blocks = optional(list(string))
            prefix_list_ids = optional(list(string))
            self = optional(string)
            security_groups = optional(set(string))
          }))
   tags = map(string)
   cidr_blocks = optional(list(string))
   }))
}


variable "prefix" {
    default = ""
}


variable "description" {
  default = "This sg group is created via terraform aws-ops-tf module"
}