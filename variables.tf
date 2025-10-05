variable "bq_data_set_name" {
  description = "BigQuery Dataset Name"
  type        = string
  default     = "demo"
}

variable "aws_region" {
  description = "AWS Region to create resources in"
  type        = string
  default     = "us-east-1"
}

variable "s3_bucket_name" {
  description = "S3 Bucket Name"
  type        = string
  default     = "my-zoomcamp-bucket-2025"
}

variable "aws_storage_class" {
  description = "AWS Storage Class for lifecycle management"
  type        = string
  default     = "STANDARD_IA"
}
