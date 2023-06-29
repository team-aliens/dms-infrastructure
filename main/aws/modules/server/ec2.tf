data "aws_ami" "ubuntu" {
    most_recent = true
    filter {
        name   = "name"
        values = [var.ami_name]
    }
    owners = [var.ami_owners]
}

resource "aws_instance" "server" {

    ## Instance optoins ##
    ami                         = data.aws_ami.ubuntu.id
    ebs_optimized               = true

    availability_zone           = var.instance_az
    instance_type               = var.instance_type
    key_name                    = var.key_name
    subnet_id                   = var.subnet_id

    monitoring                  = false
    associate_public_ip_address = false
    source_dest_check           = true

    tags = {
        "Name" = "${var.server_name}"
    }

    root_block_device {
        volume_type           = "gp2"
        volume_size           = 20
        tags                  = {}
        delete_on_termination = true
    }

    capacity_reservation_specification {
        capacity_reservation_preference = "open"
    }

    cpu_options {
        core_count       = 1
        threads_per_core = 2
    }

    enclave_options {
        enabled = false
    }

    maintenance_options {
        auto_recovery = "default"
    }

    metadata_options {
        http_endpoint               = "enabled"
        http_put_response_hop_limit = 1
        http_tokens                 = "optional"
        instance_metadata_tags      = "disabled"
    }

    private_dns_name_options {
        enable_resource_name_dns_a_record    = true
        enable_resource_name_dns_aaaa_record = false
        hostname_type                        = "ip-name"
    }

    ## Nginx options ##
    connection {
        user        = "ubuntu"
        type        = "ssh"
        port        = var.ssh_port
        host        = self.public_ip 
        private_key = var.private_key
    }

    provisioner "remote-exec" {
        inline = [
            "sudo -p mkdir /etc/nginx/sites-enabled"
        ]
    }

    provisioner "file" {
        source = "${path.module}/nginx/${var.server_name}"
        destination = "/etc/nginx/sites-enabled"
    }

    provisioner "remote-exec" {
        inline = [
            "sudo apt-get update",
            "sudo apt install nginx",
            "sudo systemctl start nginx",
            "sudo snap install --classic certbot",
            "sudo ln -s /snap/bin/certbot /usr/bin/certbot",
            <<EOT
                sudo certbot --nginx -n
                %{ for domain in var.domains~}
                -d ${domain}
                %{ endfor ~}
            EOT
        ]
    }
}
