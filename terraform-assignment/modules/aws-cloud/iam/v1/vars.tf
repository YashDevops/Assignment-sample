variable "iam_role_details" {
  type = map(object({
   name = string
   policy = string
   tags = map(string)
   }))
}

variable "region" {
  default = "ap-south-1"
}