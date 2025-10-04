terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket = "my-zoomcamp-bucket-2025"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "demo" {
  bucket = "my-demo-zoomcamp-bucket-2025"
}

output "bucket_name" {
  value = aws_s3_bucket.demo.bucket
}
output "bucket_arn" {
  value = aws_s3_bucket.demo.arn
}
output "bucket_region" {
  value = aws_s3_bucket.demo.region
}
