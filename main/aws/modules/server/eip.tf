resource "aws_eip" "eip" {
  instance = aws_instance.server.id
  tags = {
    "Name" = "${var.server_name}"
  }
}