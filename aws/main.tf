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
  source = "./server"
  server_name = "DMS-PROD"
  sg_id = aws_security_group.dms_sg.id
  private_key_pem = aws_key_pair.dms_server_key
  domains = [ "api.aliens-dms.com" ]
}

module "dev" {
  source = "./server"
  server_name = "DMS-DEV"
  sg_id = aws_security_group.dms_sg.id
  private_key_pem = aws_key_pair.dms_server_key
  domains = [ "api-dev.aliens-dms.com" ]
}
