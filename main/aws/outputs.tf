output "prod_eip" {
  value = module.prod.server_ip
}

output "dev_eip" {
  value = module.dev.server_ip
}
