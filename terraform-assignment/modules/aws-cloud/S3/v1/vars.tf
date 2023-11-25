variable "region" {
  default = "ap-south-1"
}

variable "s3_details" {
  type = map(object({
   bucket = string
   version_enable = bool
   tags = map(string)
   sse_algorithm = optional(string)
   kms_master_key_id = optional(string)
   s3_policy_location = optional(string)
   bucket_policy_required = optional(bool)
   lifecycle_infrequent_storage_transition_enabled = bool
   lifecycle_glacier_transition_enabled = bool
   lifecycle_expiration_enabled = bool
   lifecycle_expiration_object_prefix = optional(string)
   lifecycle_days_to_infrequent_storage_transition  = optional(number)
   lifecycle_infrequent_storage_object_prefix = optional(string)
   lifecycle_glacier_object_prefix = optional(string)
   lifecycle_days_to_glacier_transition = optional(number)
   lifecycle_days_to_expiration = optional(string)
   cors_rule = any
   logging_enabled = optional(bool)
   }))
}


variable "prefix" {
  default = ""
}