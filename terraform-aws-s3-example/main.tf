resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  acl    = "private"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256" # or "aws:kms" with kms_master_key_id
      }
    }
  }

  lifecycle_rule {
    id      = "expire-noncurrent-versions"
    enabled = true

    noncurrent_version_expiration {
      days = var.lifecycle_days
    }
  }

  tags = {
    Name        = var.bucket_name
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}

# Block public access to avoid accidental public buckets
resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}