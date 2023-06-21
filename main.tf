terraform {

  cloud {
    organization = "teamdms"
    workspaces {
      name = "dms"
    }
  }

}

module "aws" {
  source = "./aws"
}

module "cloudflare" {
  zone_id = var.cloudflare_zone_id
  account_id = var.cloudflare_account_id
  source = "./cloudflare"
  prod_eip = module.aws.prod_eip
  dev_eip = module.aws.dev_eip
}
