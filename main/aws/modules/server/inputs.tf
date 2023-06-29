variable "server_name" {
    type = string
}

variable "key_name" {
    type = string
}

variable "private_key" {
    type = string
}

variable "subnet_id" {
    type = string
}

variable "domains" {
    type = list(string)
}

variable "ssh_port" {
    type = number
    default = 2222
}

variable "allow_ports" {
    type = set(number)
    default = [ 80, 443, 2222, 3306, 6379, 8080 ]
}

variable "ami_name" {
    type = string
    default = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
}

variable "ami_owners" {
    type = string
    default = "099720109477"
}

variable "instance_az" {
    type = string
    default = "ap-northeast-2c"
}

variable "instance_type" {
    type = string
    default = "c5d.large"
}