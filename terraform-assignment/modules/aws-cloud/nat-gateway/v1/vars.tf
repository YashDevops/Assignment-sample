variable "natgateway_details" {
  description = "This variable used to gather all the requriment for subnets"
  type = map(object({
    subnet_id  = string
    Name        = string
    allocation_id = optional(string)
    connectivity_type = string
    prefix      = optional(string)
    tags = map(string)
    })
  )
}

