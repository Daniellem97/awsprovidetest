provider "aws" {
  assume_role_with_web_identity {
    role_arn = var.aws_role_arn
    web_identity_token_file = "/mnt/workspace/spacelift.oidc"
  }
}

variable "aws_role_arn" {
  description = "The ARN of the role to assume via OIDC"
  type        = string
}

resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket-ibdfosubfub"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
