output "s3_bucket_name" {
  value = "${aws_s3_bucket.bucket.id}"
}

output "s3_bucket_domain_name" {
  value = "${aws_s3_bucket.bucket.bucket_domain_name}"
}
