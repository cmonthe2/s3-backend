
# Create IAM policy for Terraform state access
resource "aws_iam_policy" "terraform_state_policy" {
  name        = "TerraformStateAccess"
  description = "IAM policy for Terraform state access"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["s3:GetObject", "s3:PutObject", "s3:ListBucket"]
        Resource = [
          "arn:aws:s3:::my-terraform-state",
          "arn:aws:s3:::my-terraform-state/*"
        ]
      },
      {
        Effect   = "Allow"
        Action   = ["dynamodb:GetItem", "dynamodb:PutItem", "dynamodb:DeleteItem"]
        Resource = "arn:aws:dynamodb:us-east-1:YOUR_AWS_ACCOUNT_ID:table/terraform-lock"
      }
    ]
  })
}

output "iam_policy_arn" {
  value = aws_iam_policy.terraform_state_policy.arn
}
