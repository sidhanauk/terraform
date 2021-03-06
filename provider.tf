provider "aws"{
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "harpal-dhillon-terraform-bucket"
    key    = "tf-key"
    region = "us-east-1"
  }
}
