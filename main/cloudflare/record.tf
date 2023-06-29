resource "cloudflare_record" "api" {
  zone_id  = "${var.zone_id}"
  name    = "api"
  value   = var.prod_eip
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "api-dev" {
  zone_id  = "${var.zone_id}"
  name    = "api-dev"
  value   = var.dev_eip
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "test" {
  zone_id = "${var.zone_id}"
  name    = "test"
  value   = var.dev_eip
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "admin" {
  zone_id = "${var.zone_id}"
  name    = "admin"
  value   = cloudflare_pages_project.admin_pages.subdomain
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_record" "admin_dev" {
  zone_id = "${var.zone_id}"
  name    = "admin-dev"
  value   = "dev.${cloudflare_pages_project.admin_pages.subdomain}"
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_record" "guide" {
  zone_id = "${var.zone_id}"
  name    = "guide"
  value   = "notion.so"
  type    = "CNAME"
  proxied = true
}
