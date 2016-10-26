provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region = "${var.aws_region}"
}

module aws_networking {
  source = "../../modules/aws_networking"

  region = "${var.aws_region}"

  project_name = "${var.project_name}"
  env          = "ci"
}

resource aws_key_pair "ci" {
  key_name = "${var.project_name}.ci"
  public_key = "${file("../../ssh_keys/id_rsa_ci.pub")}"
}

resource aws_route53_zone "public" {
  name = "${var.public_zone_name}."
  force_destroy = false
}