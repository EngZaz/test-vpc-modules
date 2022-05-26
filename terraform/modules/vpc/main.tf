terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}
resource "aws_vpc" "main" {
  cidr_block = var.vpc_test
}

resource "aws_vpc" "loop_vpc" {
    for_each = var.vpc_loop_test
    cidr_block = each.value.cidr
}

resource "aws_subnet" "multiple-subnets" {
  for_each = var.subnet_values
  vpc_id     = aws_vpc.loop_vpc["vpc-1"].id
  cidr_block = each.value.cidr
  availability_zone = each.value.az

  tags = {
    Name = each.value.tag
  }
}
