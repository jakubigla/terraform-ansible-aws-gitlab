resource null_resource "gitlab_provisioner"
{
  provisioner "local-exec" "gitlab" {
    command = "cd ${var.ansible_path} && ./inventory/ci/ec2.py --refresh-cache && ansible-playbook -i inventory/ci plays/gitlab.yml --extra-vars=\"gitlab_host=${aws_route53_record.gitlab.name} registry_host=${aws_route53_record.registry.name} env=ci\""
  }

  provisioner "local-exec" "gitlab_runner" {
    command = "cd ${var.ansible_path} && ./inventory/ci/ec2.py --refresh-cache && ansible-playbook -i inventory/ci plays/gitlab_runner.yml --extra-vars=\"gitlab_host=${aws_route53_record.gitlab.name} registry_host=${aws_route53_record.registry.name} env=ci \""
  }

  depends_on = [
    "aws_eip.main",
    "aws_route53_record.gitlab",
    "aws_route53_record.registry"
  ]
}