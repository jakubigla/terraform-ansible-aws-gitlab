resource aws_subnet "public01_a" {
  vpc_id = "${aws_vpc.default.id}"

  cidr_block = "${var.cidr_prefix}.40.0/24"
  availability_zone = "${var.region}a"

  tags {
    Name = "${var.project_name}.${var.env}.public01_a"
    Type = "Public"
    Env = "${var.env}"
    Namespace = "${var.project_name}"
  }
}

resource aws_route_table_association "public01_a" {
  subnet_id = "${aws_subnet.public01_a.id}"
  route_table_id = "${aws_route_table.public.id}"
}