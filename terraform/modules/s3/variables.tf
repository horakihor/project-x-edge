variable "s3_bucket_acl" {
  default = "private"
}

variable "s3_bucket_name" {}

variable "tags" {
  default = {
    environment = "project-x"
    created_by  = "terraform"
  }
}
