provider "aws" {
  alias  = "east"
  region = "us-east-1"
}

module "vpc-test" {
  source = "./modules/vpc"
  providers = {
    aws = aws.east
  }
  vpc_test      = "10.100.0.0/16"
  vpc_loop_test = var.vpc_loop_test
  subnet_values = var.subnet_values
}