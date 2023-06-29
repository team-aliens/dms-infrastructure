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

module "prod-vpc" {
  source   = "./modules/vpc"
  vpc_name = "DMS-PROD-VPC"
  public_subnets = [ "10.0.0.0/20" ]
}

module "prod" {
  source      = "./modules/server"
  server_name = "DMS-PROD"
  subnet_id   = module.prod-vpc.public_subnet_ids[0]

  key_name    = aws_key_pair.dms_server_key.key_name
  private_key = tls_private_key.private_key.private_key_pem
  domains     = [ "api.aliens-dms.com" ]
}

module "dev-vpc" {
  source   = "./modules/vpc"
  vpc_name = "DMS-DEV-VPC"
  public_subnets = [ "10.0.0.0/20" ]
}

module "dev" {
  source      = "./modules/server"
  server_name = "DMS-DEV"
  subnet_id   = module.dev-vpc.public_subnet_ids[0]

  key_name    = aws_key_pair.dms_server_key.key_name
  private_key = tls_private_key.private_key.private_key_pem
  domains     = [ "api-dev.aliens-dms.com" ]
}