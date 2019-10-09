#########################
# Global Configurations #
#########################

terraform {
  #required_version = ">=0.11.7"
  backend "s3" {}
}

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.region}"
}

###############

# Create S3 bucket
module "s3" {
  source         = "modules/s3"
  s3_bucket_acl  = "private"
  s3_bucket_name = "hazelcast-project-x-lambda-dev-hz"
}

# Create CloudFront
module "cloudfront" {
  source                = "modules/cloudfront"
  s3_bucket_name        = "${module.s3.s3_bucket_name}"
  s3_bucket_domain_name = "${module.s3.s3_bucket_domain_name}"
}

# Create lambda
module "lambda" {
  source           = "modules/lambda"
  lambda_name      = "lambda"
  lambda_s3_bucket = "hazelcast-project-x-lambda-dev"
  lambda_s3_key    = "v1.0.0/lambda.zip"
}
