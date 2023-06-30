variable "vpc_name" {
    type = string
    default = "VPC"
}

variable "vpc_cidr" {
    type = string
    default = "10.0.0.0/16"
}

variable "azs" {
    type = list(string)
    default = slice(data.aws_availability_zones.zones.names, 0, 3)
}

variable "public_subnets" {
  type    = list(string)
  default = []
}

variable "private_subnets" {
  type    = list(string)
  default = []
}