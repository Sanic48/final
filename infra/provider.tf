provider "aws" {

 	access_key 	= "${file("${var.aws_access_key}")}"
  	secret_key 	= "${file("${var.aws_secret_key}")}"
  	region  	= "eu-central-1"
}
