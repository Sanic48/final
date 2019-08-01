resource "aws_vpc" "main" {
  cidr_block = "${var.vpc_cidr_range}"
  enable_dns_hostnames = true
  tags {
    Name = "${var.project}-vpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = "${var.public_subnet_cidr}"
  availability_zone = "eu-central-1a"

  tags {
    Name = "${var.project}-public"
  }
}

resource "aws_subnet" "public-2" {
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = "${var.public_subnet_cidr-2}"
  availability_zone = "eu-central-1b"

  tags {
    Name = "${var.project}-public-2"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.main.id}"
  tags {
    Name = "InternetGateway"
  }
}

resource "aws_route" "internet_access" {
  route_table_id         = "${aws_vpc.main.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.gw.id}"
}
