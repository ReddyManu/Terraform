provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "b60-terraform"
    key    = "example/sample/terraform.tfstate"
    region = "us-east-1"
  }
}

module "ec2" {
  source = "./ec2"
  SGID   = module.sg.SGID
  name   = ["new1", "new2"]
}

module "sg" {
  source = "./sg"
}




