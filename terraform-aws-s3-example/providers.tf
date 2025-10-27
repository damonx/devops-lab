provider "aws" {
  region = var.aws_region
  # Credentials can be provided via environment variables or shared credentials file:
  # AWS_PROFILE, AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY
}