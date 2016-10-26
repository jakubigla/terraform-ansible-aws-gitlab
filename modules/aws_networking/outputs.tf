output vpc_id {
  value = "${aws_vpc.default.id}"
}

output subnet_id {
  value = "${aws_subnet.public01_a.id}"
}

output default_sg_id {
  value = "${aws_security_group.default.id}"
}