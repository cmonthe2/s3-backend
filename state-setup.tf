# This file is used to create the S3 bucket and DynamoDB table that will be used to store the Terraform state file and lock information.

resource "aws_s3_bucket" "terraform_state" {
  bucket = var.bucket_name
  lifecycle {
    prevent_destroy = true
  }
  versioning {
    enabled = true
  }
  tags = {
    Name = "Terraform State Bucket"
  }
}

resource "aws_dynamodb_table" "terraform_lock" {
  name         = var.dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "Terraform Lock Table"
  }
}

output "s3_bucket" {
  value = aws_s3_bucket.terraform_state.bucket
}

output "dynamodb_table" {
  value = aws_dynamodb_table.terraform_lock.name
}
