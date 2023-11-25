locals {
s3_policy_block = {    for k, v in var.s3_details : k => {
    name = v.bucket
    s3_policy_location = v.s3_policy_location
  }if v.bucket_policy_required == true
}
}