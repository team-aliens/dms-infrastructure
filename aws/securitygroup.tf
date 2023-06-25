resource "aws_security_group" "dms_sg" {
    name        = "launch-wizard-1"
    description = "launch-wizard-1 created 2022-11-06T09:58:57.937Z"
    vpc_id      = "vpc-01dcb1d1b25f29503"

    ingress {
        description     = ""
        from_port       = 80
        to_port         = 80
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    ingress {
        description     = ""
        from_port       = 8080
        to_port         = 8080
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    ingress {
        description     = ""
        from_port       = 6379
        to_port         = 6379
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    ingress {
        description     = ""
        from_port       = 2222
        to_port         = 2222
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    ingress {
        description     = ""
        from_port       = 3306
        to_port         = 3306
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    ingress {
        description     = ""
        from_port       = 443
        to_port         = 443
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    egress {
        description     = ""
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }

}