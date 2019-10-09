variable "cloudfront_enabled" {
  default = true
}

variable "s3_bucket_name" {}

variable "s3_bucket_domain_name" {}

variable "tags" {
  default = {
    environment = "project-x"
    created_by  = "terraform"
  }
}
