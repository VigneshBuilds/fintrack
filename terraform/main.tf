provider "aws" {
  region = "ap-south-1"
}
module "network" {
  source         = "./modules/network"
  env            = var.env
  public_sn_zone = var.public_sn_zone
}

