# Routes Table
resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.project.id}"

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = "${aws_internet_gateway.project-igw.id}"
  }

  tags = {
      Name = "${var.project_name}-public"
  }
}

resource "aws_route_table_association" "public-a" {
    subnet_id                   = "${aws_subnet.public-sn_1a.id}"
    route_table_id              = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "public-c" {
    subnet_id                   = "${aws_subnet.public-sn_1c.id}"
    route_table_id              = "${aws_route_table.public.id}"
}
