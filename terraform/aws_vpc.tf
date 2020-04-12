# VPC
resource "aws_vpc" "project" {
    cidr_block           = "${var.vpc_cidr}"
    instance_tenancy     = "default"
    enable_dns_support   = true
    enable_dns_hostnames = true

    tags = {
        Name = "${var.project_name}-vpc"
    }
}

# Internet Gateway
resource "aws_internet_gateway" "project-igw" {
    vpc_id = "${aws_vpc.project.id}"

    tags = {
        Name = "${var.project_name}-igw"
    }
}
