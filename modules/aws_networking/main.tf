resource aws_vpc "default" {
  cidr_block = "${var.cidr_block}"
  enable_dns_hostnames = true

  tags {
    Name = "${var.project_name}.${var.env}.vpc"
    Env = "${var.env}"
    Namespace = "${var.project_name}"
  }
}

resource aws_internet_gateway "default" {
  vpc_id = "${aws_vpc.default.id}"

  tags {
    Name = "${var.project_name}.${var.env}.ig"
    Env = "${var.env}"
    Namespace = "${var.project_name}"
  }
}

resource aws_route_table "public" {
  vpc_id = "${aws_vpc.default.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.default.id}"
  }

  tags {
    Name = "${var.project_name}.${var.env}.rtb"
    Env = "${var.env}"
    Namespace = "${var.project_name}"
  }
}