resource "aws_subnet" "subnet_1a" {
    vpc_id            = "${aws_vpc.project.id}"
    cidr_block        = "${var.vpc_public-a}"
    availability_zone = "${var.region}a"
    map_public_ip_on_launch = false

    tags = {
        Name = "${var.project_name}-subnet.1a"
    }
}

resource "aws_subnet" "subnet_1c" {
    vpc_id            = "${aws_vpc.project.id}"
    cidr_block        = "${var.vpc_public-c}"
    availability_zone = "${var.region}c"
    map_public_ip_on_launch = false

    tags = {
        Name = "${var.project_name}-subnet.1c"
    }
}
