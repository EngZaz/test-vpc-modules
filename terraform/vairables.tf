variable "vpc_test" {
    default = "10.55.0.0/16"
}

variable "vpc_loop_test" {
  default = {
  vpc-1 = {
      cidr = "10.9.0.0/16"
     }
     vpc-2 = {
         cidr = "10.99.0.0/16"
     }
  }
} 