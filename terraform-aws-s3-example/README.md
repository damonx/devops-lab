# Terraform AWS S3 Bucket Example

This repository demonstrates how to use **Terraform** to provision a secure, versioned **Amazon S3 bucket** with best-practice configurations, including encryption, lifecycle management, and public-access blocking.

---

## Overview

This Terraform configuration:
- Creates a **private S3 bucket**
- Enables **versioning** for object recovery
- Applies **AES-256 server-side encryption**
- Sets a **lifecycle rule** to expire old object versions
- Blocks **all forms of public access**
- Outputs the **bucket name** and **ARN**

This is a minimal yet production-ready example for learning or bootstrapping AWS infrastructure.

---
## Project Structure
```bash
.
├── main.tf                 # Main resources (S3 bucket + access block)
├── variables.tf            # Input variables with defaults
├── providers.tf            # AWS provider configuration
├── versions.tf             # Terraform + provider version constraints
├── outputs.tf              # Output values (bucket name + ARN)
└── README.md               # Project documentation
```
---

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads) >= 1.0.0  
- AWS credentials configured via one of the following:
  - `aws configure`
  - Environment variables (`AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`)
  - Shared credentials file or `AWS_PROFILE`

Ensure you have permission to create **S3 buckets** in your target AWS account.

---

## Usage

```bash
cd terraform-aws-s3-example

# Initialize Terraform
terraform init
# Preview the plan
terraform plan -var="bucket_name=your-unique-bucket-name-001"
# Apply the configuration
terraform apply -var="bucket_name=your-unique-bucket-name-001"

# Cleanup
terraform destroy -var="bucket_name=your-unique-bucket-name-001"
```

## Notes & best practices
-	Bucket name must be globally unique — change the bucket_name before apply.
-	For production, consider using KMS (sse_algorithm = "aws:kms") with a customer-managed KMS key.
-	Consider enabling bucket logging and access logging for auditability.
-	Use a remote backend (S3 + DynamoDB lock) for team collaboration (see versions.tf backend block).
-	Add IAM policies or a dedicated IAM role if other services need access; avoid broad ACLs.
