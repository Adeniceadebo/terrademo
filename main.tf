terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  # Terraform backend for remote state storage
  backend "s3" {
    bucket = "my-zoomcamp-bucket-2025-adebowale"  
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
  }
}

# Configure AWS provider
provider "aws" {
  region = var.aws_region
}

# Import your local SSH public key into AWS
resource "aws_key_pair" "zoomcamp_key" {
  key_name   = "zoomcamp-key"
  public_key = file("~/.ssh/zoomcamp-key.pub")
}

# Launch a small EC2 instance for testing
resource "aws_instance" "zoomcamp_ec2" {
  ami           = "ami-091d7d61336a4c68f"  # Amazon Linux 2 (us-east-1)
  instance_type = "t3.micro"
  key_name      = aws_key_pair.zoomcamp_key.key_name

  tags = {
    Name = "zoomcamp-ec2-demo"
  }
}

# Create a demo S3 bucket
resource "aws_s3_bucket" "demo" {
  bucket        = "my-zoomcamp-bucket-2025-adebowale-demo"
  force_destroy = true
}

# Add lifecycle policy: move objects to Infrequent Access after 30 days
resource "aws_s3_bucket_lifecycle_configuration" "demo_lifecycle" {
  bucket = aws_s3_bucket.demo.id

  rule {
    id     = "move-to-ia"
    status = "Enabled"

    transition {
      days          = 30
      storage_class = var.aws_storage_class
    }
  }
}

# Outputs
output "bucket_name" {
  value = aws_s3_bucket.demo.bucket
}

output "bucket_arn" {
  value = aws_s3_bucket.demo.arn
}

output "ec2_instance_id" {
  value = aws_instance.zoomcamp_ec2.id
}

output "ec2_public_ip" {
  value = aws_instance.zoomcamp_ec2.public_ip
}
