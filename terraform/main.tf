provider "aws" {
    region = "${var.region}"
}

provider "aws" {
  alias  = "virginia"
  region = "us-east-1"
}

terraform {
    required_version = ">= 0.12.8"

    backend "s3" {
        bucket = "terraform-xxx"
        key    = "wordpress/tfstate.aws"
        region = "ap-northeast-1"
    }
}
