output "data_bucket_name" {
  value = aws_s3_bucket.kendrix_data.bucket
}

output "data_bucket_arn" {
  value = aws_s3_bucket.kendrix_data.arn
}

output "github_actions_role_arn" {
  value = aws_iam_role.github_actions.arn
}