terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }
}

provider "cloudflare" {
  api_key = "51c378c3674d104a9261b09bc8f370c45fac6"
  email = "sdpthf@gmail.com"
}
 