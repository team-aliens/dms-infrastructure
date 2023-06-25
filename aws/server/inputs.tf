variable "server_name" {
    description = "server name"
}

variable "sg_id" {
    description = "security group id"
}

variable "ssh_port" {
    description = "ssh port"
}

variable "private_key" {
    description = "instance private key pem"
}

variable "domains" {
    type        = list(string)
    description = "domains to using in instance"
}
