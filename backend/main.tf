terraform {
  required_version = ">= 1.10.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}


provider "aws" {
  region = "us-east-1"
}

# Create S3 Bucket for Terraform State

#resource "aws_s3_bucket" "terraform_state" {
#  bucket = "vishnu-terraform-state-us-east-1-2026"

#  tags = {
#    Name        = "Terraform State Bucket"
#    Environment = "Backend"
#  }
# }


resource "aws_s3_bucket" "terraform_state" {
  bucket        = "vishnu-terraform-state-us-east-1-2026"
  force_destroy = true

  tags = {
    Name        = "Terraform State Bucket"
    Environment = "Backend"
  }
}

# S3 Backend Configuration
# Keep this commented until the S3 bucket and DynamoDB table are created

# terraform {
#   backend "s3" {
#     bucket         = "vishnu-terraform-state-us-east-1-2026"
#     key            = "dev/terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "terraform-state-lock"
#     encrypt        = true
#   }
# }


# Enable Versioning
resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Enable Server-Side Encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256" // AES256 means S3 uses SSE-S3 encryption.
    }
  }
}

# Block All Public Access
resource "aws_s3_bucket_public_access_block" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}

# DynamoDB Table for Terraform State Locking

resource "aws_dynamodb_table" "terraform_lock" {
  name         = "terraform-state-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}



