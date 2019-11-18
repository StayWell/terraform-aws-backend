module "this" {
  source     = "StayWell/backend/aws"
  version    = "0.2.0"
  identifier = "${var.env}"
}

provider "aws" {
  region = "${var.region}"
}

variable "region" {
  default = "us-west-2"
}

variable "env" {
  description = "Calculated in the Bitbucket pipeline based on git repository name"
}
