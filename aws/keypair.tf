resource "tls_private_key" "private_key" {
    algorithm   = "RSA"
    rsa_bits  = 4096
}

resource "aws_key_pair" "dms_server_key" {
    key_name   = "DMS_SERVER_KEY"
    public_key = "${tls_private_key.private_key.public_key_openssh}"
}