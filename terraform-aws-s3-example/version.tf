terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }

  # Optional: uncomment & configure to use remote state in S3
  # backend "s3" {
  #   bucket = "my-terraform-state-bucket"
  #   key    = "project/terraform.tfstate"
  #   region = "us-east-1"
  # }
}