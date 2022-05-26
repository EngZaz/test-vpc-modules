provider "aws" {
  alias  = "east"
  region = "us-east-1"
}

module "vpc-test" {
  source = "./modules/vpc"
  providers = {
    aws = aws.east
  }
  vpc_test = "10.8.0.0/16"
}