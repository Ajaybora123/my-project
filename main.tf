provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "demo_bucket" {
  bucket = "my-demo-bucket-12345"
  acl    = "private"
}
