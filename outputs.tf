output "bucket_url" {
  value = aws_s3_bucket.main.bucket_regional_domain_name
}

output "bucket_region" {
  value = aws_s3_bucket.main.region
}

output "access_key_id" {
  value = aws_iam_access_key.s3.id
}

output "access_key_secret" {
  value = aws_iam_access_key.s3.secret
}
