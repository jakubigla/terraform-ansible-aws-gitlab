# Gitlab on AWS

## TL;TR
This project installs Gitlab CE and Gitlab Runner on EC2 instance of your choice.

## What exactly does this project do?

1. Creates small AWS infrastructure using [Terraform](https://www.terraform.io/) formed with:
 * VPC
 * Internet Gateway
 * Route Table
 * One public subnet
 * Security Group that allows traffic from everywhere to ports 22, 80, 443
 * EC2 Instance 
 * EIP
 * Route53 subdomain records
 

2. Provisions EC2 instance using [Ansible](https://www.ansible.com/) with:
 * Docker
 * Docker Garbage Collector (by Spotify)
 * Gitlab
 * Gitlab runner with docker executor
 * SSL Certificates
 
## Installation

Go to `environments/ci`, create a file called `terraform.tfvars` based on `terraform.tfvars.sample` and update it with your AWS credentials.

Get VM up by running ```vagrant up```. This will provision Vagrant box with ansible, terraform and docker.

Run ```make ENV=ci plan``` to create an execution plan.

Run ```make ENV=ci apply``` to execute terraform scripts. 