provider "aws" {
  region = "us-east-1"
}
terraform {
  backend "s3" {
    bucket = "terraform-remote-state-5c1f261e-f412-4e1e-8907-63ba259ec6f5"
    key = "state"
    region = "us-east-1"
  }
}
