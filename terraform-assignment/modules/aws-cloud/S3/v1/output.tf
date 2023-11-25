output "s3_created" {
  description = "Details about the s3 bucketed  created"
  value = {
    for k, this in aws_s3_bucket.this : k => {
      id                         = this.id
      arn                        = this.arn
      bucket_domain_name         = this.bucket_domain_name 
      region                     = this.region
      hosted_zone_id             = this.hosted_zone_id
      website_endpoint           = this.website_endpoint
      website_domain             = this.website_domain
      tags_all                   = this.tags_all
    }
  }
}

output "test" {
   description = "Details about the s3 bucketed  created"
   value = local.s3_policy_block
}