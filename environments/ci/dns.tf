resource aws_route53_record "gitlab" {
  zone_id = "${aws_route53_zone.public.id}"
  name = "gitlab.${var.public_zone_name}"
  type = "A"
  ttl = 300
  records = ["${aws_eip.main.public_ip}"]
}

resource aws_route53_record "registry" {
  zone_id = "${aws_route53_zone.public.id}"
  name = "registry.${var.public_zone_name}"
  type = "A"
  ttl = 300
  records = ["${aws_eip.main.public_ip}"]
}