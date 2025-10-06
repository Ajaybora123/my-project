terraform {
   agent any
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "random_id" "rand" {
  byte_length = 4
}

resource "aws_s3_bucket" "demo_bucket" {
  bucket = "jenkins-terraform-demo-${random_id.rand.hex}"
}

output "bucket_name" {
  value = aws_s3_bucket.demo_bucket.bucket
}
