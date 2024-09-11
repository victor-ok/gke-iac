variable "prefix" {}

variable "project_id" {}
variable "network_name" {}

variable subnet_name {}
variable subnet_ip {}
variable subnet_region {}
variable "mtu" {}

variable "ip_cidr_range" {}

# variable "credentials_file" { }

variable "region" {
  default = "us-central1"
}

variable "zone" {
  default = "us-central1-c"
}
