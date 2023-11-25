resource "aws_s3_bucket" "this" {
  for_each = var.s3_details
  bucket = each.value.bucket
  tags = each.value.tags

  server_side_encryption_configuration {
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = each.value.sse_algorithm == null ? "AES256" : each.value.sse_algorithm
      kms_master_key_id = each.value.kms_master_key_id == null ? null : each.value.kms_master_key_id
    }
  }
}

    lifecycle_rule {
      id      = "transition-to-infrequent-access-storage"
      enabled = each.value.lifecycle_infrequent_storage_transition_enabled
      prefix  = each.value.lifecycle_infrequent_storage_object_prefix
      tags    = each.value.tags

      transition {
        days          = each.value.lifecycle_days_to_infrequent_storage_transition == null ? "40" : each.value.lifecycle_days_to_infrequent_storage_transition == null
        storage_class = "STANDARD_IA"
      }
    }

    lifecycle_rule {
      id      = "transition-to-glacier"
      enabled = each.value.lifecycle_glacier_transition_enabled
      prefix = each.value.lifecycle_glacier_object_prefix == "" || each.value.lifecycle_glacier_object_prefix == null ? "" : each.value.lifecycle_glacier_object_prefix
      tags = each.value.lifecycle_glacier_object_prefix == "" || each.value.lifecycle_glacier_object_prefix == null ? {} : each.value.tags

      transition {
        days          = each.value.lifecycle_days_to_glacier_transition
        storage_class = "GLACIER"
      }
    }

    lifecycle_rule {
      id      = "expire-objects"
      enabled = each.value.lifecycle_expiration_enabled
      prefix  = each.value.lifecycle_expiration_object_prefix

       expiration {
         days = each.value.lifecycle_days_to_expiration
        }
     }

   dynamic "logging" {
     for_each = each.value.logging_enabled ? [1] : []
    content {
       target_bucket = each.value.target_s3_bucket
       target_prefix = "log/${each.value.bucket}"
    }
  }
     
   dynamic "cors_rule" {
     for_each = try(jsondecode(each.value.cors_rule), each.value.cors_rule)

   content {
     allowed_methods = cors_rule.value.allowed_methods
     allowed_origins = cors_rule.value.allowed_origins
     allowed_headers = lookup(cors_rule.value, "allowed_headers", null)
     expose_headers  = lookup(cors_rule.value, "expose_headers", null)
     max_age_seconds = lookup(cors_rule.value, "max_age_seconds", null)
   }
 }

  versioning {
    enabled = each.value.version_enable
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  for_each = aws_s3_bucket.this
  bucket = each.value.id
  block_public_acls   = true
  ignore_public_acls  = true
  block_public_policy = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "this" {
 for_each = local.s3_policy_block
 bucket = aws_s3_bucket.this["${each.value.name}"].id
 policy = file("${each.value.s3_policy_location}")
}

resource "aws_s3_bucket_ownership_controls" "s3_bucket_acl_ownership" {
  for_each = aws_s3_bucket.this
  bucket = each.value.id
  rule {
    object_ownership = "ObjectWriter"
  }
}