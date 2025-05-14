terraform {
  provider "aws" {
  region = "ap-south-1"
}
  backend "s3" {
    bucket         = ""
    key            = ""
    region         = ""
    dynamodb_table = ""
    encrypt        = true
  }
}