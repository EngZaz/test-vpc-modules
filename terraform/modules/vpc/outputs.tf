output "vpc-id" {
  value = {
      for k, vpc in aws_vpc.loop_vpc : k => vpc.id
  }
}