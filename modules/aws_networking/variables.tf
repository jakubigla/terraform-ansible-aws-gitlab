variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "cidr_prefix" {
  default = "10.0"
}

variable "region" {
  default = "eu-central-1"
}

variable "env" {
  type = "string"
}

variable "project_name" {
  type = "string"
}

