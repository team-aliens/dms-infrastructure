resource "aws_instance" "server" {
    ami                         = "ami-0e9bfdb247cc8de84"
    availability_zone           = "ap-northeast-2c"
    ebs_optimized               = true
    instance_type               = "c5d.large"
    monitoring                  = false
    key_name                    = "DMS_SERVER_KEY"
    subnet_id                   = "subnet-0915cca8dc3e0fe3d"
    vpc_security_group_ids      = [var.sg_id]
    associate_public_ip_address = true
    source_dest_check           = true

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

    tags = {
        "Name" = "${var.server_name}"
    }
}
