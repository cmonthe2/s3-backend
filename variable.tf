variable region {
  type        = string
  default     = "us-east-1"
  description = "The AWS region to deploy resources."
}

variable bucket_name {
  type        = string
  default     = "my-terraform-state"
  description = "The name of the S3 bucket to store the Terraform state file."
}

variable dynamodb_table_name {
  type        = string
  default     = "terraform-lock"
  description = "The name of the DynamoDB table to store the Terraform state lock."
}
