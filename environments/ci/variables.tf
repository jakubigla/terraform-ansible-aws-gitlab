variable aws_access_key {}
variable aws_secret_key {}

variable "ami" {
  type = "map"
  default = {
    eu-central-1 = "ami-26c43149"
  }
}

variable "public_zone_name" {}

variable ec2_type {
  default = "t2.small"
}