variable "eip_details" {
  type = map(object({
    Name        = string
    prefix      = optional(string)
    vpc         = bool
    tags        = optional(map(string))
   }))
}