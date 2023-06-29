module "vpc" {
  source   = "../vpc"
  vpc_name = "${var.server_name}-VPC"
}