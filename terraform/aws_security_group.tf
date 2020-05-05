# ssh
resource "aws_security_group" "accept_ssh_from_local" {
    name = "${var.project_name}-accept_ssh_from_local"
    description = "do ssh to local-machine only With ${var.project_name}"
    vpc_id = "${aws_vpc.project.id}"

    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    tags = {
        Name = "${var.project_name}-sg-accept-ssh-from-local"
    }
}

resource "aws_security_group" "accept_ssh_from_owner" {
    name = "${var.project_name}-accept_ssh_from_owner"
    description = "Allow ssh from Owner With ${var.project_name}"
    vpc_id = "${aws_vpc.project.id}"

    ingress {
        from_port       = 22
        to_port         = 22
        protocol        = "tcp"
        cidr_blocks     = [
            # IP
            "127.0.0.1/32" # アクセスするIPアドレス範囲
        ]
    }

    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    tags = {
        Name = "${var.project_name}-sg-accept-ssh-from-owner"
    }
}

# web
resource "aws_security_group" "accept_web_from_owner" {
    name = "${var.project_name}-accept_web_from_owner"
    description = "Allow http from Owner With ${var.project_name}"
    vpc_id = "${aws_vpc.project.id}"

    # HTTP
    ingress {
        from_port       = 80
        to_port         = 80
        protocol        = "tcp"
        cidr_blocks     = [
            # IP
            "127.0.0.1/32", # アクセスするIPアドレス範囲
            "127.0.0.1/32" # 作成したEC2インスタンスのグローバルIPアドレス
        ]
    }

    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    tags = {
        Name = "${var.project_name}-sg-accept-web-from-owner"
    }
}

resource "aws_security_group" "accept_web_from_ec2" {
  name        = "${var.project_name}-${terraform.workspace}-accept_web_from_ec2"
  description = "Allow http from Ec2 With ${var.project_name}"
  vpc_id      = "${aws_vpc.project.id}"

  # HTTP
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-${terraform.workspace}-sg-accept-web-from-ec2"
  }
}
