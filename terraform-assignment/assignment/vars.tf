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


variable "iam_role_details" {
  type = map(object({
   name = string
   policy = string
   tags = map(string)
   }))
}


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


variable "instance_configurations" {
  type = map(object({
    ami                    = string
    instance_type          = string
    user_data              = string
    tags                   = map(string)
  }))
}

variable "cloudwatch_details" {
  type = map(object({
   alarm_name = string
   comparison_operator = string
   evaluation_periods = string
   metric_name = string
   namespace = string
   period = string
   statistic = string
   threshold = string
   alarm_description = string
   insufficient_data_actions = list(string)
   }))
}


variable "prefix" {
    default = ""
}

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
}

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

variable "eip_details" {
  type = map(object({
    Name        = string
    prefix      = optional(string)
    vpc         = bool
    tags        = optional(map(string))
   }))
}

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

