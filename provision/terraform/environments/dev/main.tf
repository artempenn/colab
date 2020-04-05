provider "aws" {
  version = "2.56"
  profile = "default"
  region  = "us-east-2"
}

terraform {
  backend "s3" {
    bucket = "terraform-b3de3caa-dev"
    key    = "poetry-app"
    region = "us-east-2"
  }
}

module "product" {
  source = "../../product"
}
