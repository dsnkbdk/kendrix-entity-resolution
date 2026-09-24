variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-2"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "github_oidc_subject" {
  description = "Exact GitHub Actions OIDC subject allowed to assume the AWS role"
  type        = string
}

variable "terraform_state_bucket_arn" {
  description = "ARN of the Terraform state bucket"
  type        = string
}