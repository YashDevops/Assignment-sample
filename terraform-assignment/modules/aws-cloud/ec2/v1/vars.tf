variable "instance_configurations" {
  type = map(object({
    ami                    = string
    instance_type          = string
    user_data              = string
    tags = map(string)
  }))
}