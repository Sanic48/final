variable "profile_name" {}
variable "vpc_cidr_range" {
default = "10.0.0.0/16"
}
variable "project" {}
variable "public_subnet_cidr" {
default = "10.0.1.0/24"
}
variable "public_subnet_cidr-2" {
default = "10.0.2.0/24"
}
variable "instace_type" {}
variable "desired_capacity" {
default = 2
}
variable "min_size" {}
variable "max_size" {}
variable "ecs_cluster" {
default = "ITEA-CLUSTER"

}
variable "ecs_key_pair_name" {
description = "ECS key pair name"
}

variable "aws_access_key" {
    default = "~/.aws/key"
}

variable "aws_secret_key" {
    default = "~/.aws/secret_key"
}
