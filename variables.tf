# AWS region for all resources
variable "aws_region" {
  description = "AWS Region where resources will be deployed"
  type        = string
  default     = "us-east-1"
}

# Main S3 bucket name for Terraform backend
variable "s3_backend_bucket" {
  description = "Existing S3 bucket used for Terraform state storage (backend)"
  type        = string
  default     = "my-zoomcamp-bucket-2025-adebowale"
}

# Demo S3 bucket name for project data
variable "s3_bucket_name" {
  description = "Name of the demo S3 bucket created by Terraform"
  type        = string
  default     = "my-zoomcamp-bucket-2025-adebowale-demo"
}

# AWS S3 storage class for lifecycle transitions
variable "aws_storage_class" {
  description = "Storage class for objects transitioned by lifecycle policy"
  type        = string
  default     = "STANDARD_IA"
}

# EC2 instance type
variable "ec2_instance_type" {
  description = "The type of EC2 instance to launch"
  type        = string
  default     = "t2.micro"
}

# Key pair name (used to SSH into EC2)
variable "ec2_key_name" {
  description = "The name of the key pair to use for EC2 access"
  type        = string
  default     = "zoomcamp-key"
}

