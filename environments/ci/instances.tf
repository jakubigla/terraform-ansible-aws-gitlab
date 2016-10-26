resource aws_instance "main" {
  instance_type = "${var.ec2_type}"
  ami = "${lookup(var.ami, var.aws_region)}"
  subnet_id = "${module.aws_networking.subnet_id}"
  count = 1
  key_name = "${aws_key_pair.ci.key_name}"
  vpc_security_group_ids = ["${module.aws_networking.default_sg_id}"]

  tags {
    Name = "${var.project_name}.ci.main"
    Env = "ci"
    Namespace = "${var.project_name}"
    AnsibleIsCI = "Yes"
  }
}

resource aws_eip "main" {
  instance = "${aws_instance.main.id}"
  vpc = true

  provisioner "remote-exec" {
    connection {
      user = "ubuntu"
      host = "${self.public_ip}"
    }
    inline = ["# Connected!"]
  }
}