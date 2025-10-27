variable "aws_region" {
  description = "AWS region to deploy to"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "S3 bucket name (must be globally unique)"
  type        = string
  default     = "example-unique-bucket-1234567890" # change before apply
}

variable "lifecycle_days" {
  description = "Number of days before noncurrent versions are expired"
  type        = number
  default     = 30
}