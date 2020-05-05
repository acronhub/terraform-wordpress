resource "aws_instance" "wordpress" {
    ami           = "ami-0507e78cf3e62daa4" #WordPress Certified by Bitnami and Automattic
    instance_type = "t3.micro"

    availability_zone = "${var.region}a"
    subnet_id = "${aws_subnet.subnet_1a.id}"

    vpc_security_group_ids = [
        "${aws_security_group.accept_ssh_from_local.id}",
        "${aws_security_group.accept_ssh_from_owner.id}",
        "${aws_security_group.accept_web_from_owner.id}",
        "${aws_security_group.accept_web_from_ec2.id}"
    ]

    associate_public_ip_address = true

    root_block_device {
        volume_type = "gp2"
        volume_size = 10
    }

    key_name = "${aws_key_pair.wordpress-auth.id}"

    tags = {
        Name = "new-${var.project_name}-ec2-wordpress"
    }
}

resource "aws_eip" "wordpress" {
  vpc        = true

  instance   = "${aws_instance.wordpress.id}"
  depends_on = ["aws_internet_gateway.project-igw"]
}

resource "aws_key_pair" "wordpress-auth" {
  key_name   = "${var.ssh_key_name}"
  public_key = "${file(".ssh/id_rsa.pub")}"
}
