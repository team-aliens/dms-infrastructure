terraform {

  backend "remote" {
    hostname = "app.terraform.io"
    organization = "teamdms"
    workspaces {
      prefix = "dms"
    }
  }

}

module "aws" {
  source = "./aws"
}

module "cloudflare" {
  source = "./cloudflare"
  prod_eip = module.aws.prod_eip
  dev_eip = module.aws.dev_eip
}
