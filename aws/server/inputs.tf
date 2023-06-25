variable "server_name" {
    description = "server name"
}

variable "sg_id" {
    description = "security group id"
}

variable "private_key_pem" {
    description = "instance private key pem"
}

variable "domains" {
    type        = list(string)
    description = "domains to using in instance"
}
