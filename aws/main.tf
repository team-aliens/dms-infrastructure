terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "ap-northeast-2"
}

module "prod" {
  source      = "./server"
  server_name = "DMS-PROD"
  ssh_port    = 2222
  sg_id       = aws_security_group.dms_sg.id
  private_key = tls_private_key.private_key
  domains     = [ "api.aliens-dms.com" ]
}

module "dev" {
  source      = "./server"
  server_name = "DMS-DEV"
  ssh_port    = 2222
  sg_id       = aws_security_group.dms_sg.id
  private_key = tls_private_key.private_key
  domains     = [ "api-dev.aliens-dms.com" ]
}