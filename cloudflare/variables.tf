variable zone_id {
    description = "cloudflare zoneId"
    type        = string
    sensitive   = true
}

variable prod_eip {
    description = "prod server ip"
}

variable dev_eip {
    description = "dev server ip"
}