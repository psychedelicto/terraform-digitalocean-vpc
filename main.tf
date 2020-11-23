## Managed By : CloudDrove
##Description : This Script is used to create VPC.
## Copyright @ CloudDrove. All Right Reserved.


#Module      : LABEL
#Description : Terraform label module variables.
module "labels" {
  source      = "clouddrove/labels/digitalocean"
  version     = "0.13.0"
  name        = var.name
  application = var.application
  environment = var.environment
  label_order = var.label_order
}

#Module      : VPC
#Description : VPCs are virtual networks containing resources that can communicate with each other in full isolation, using private IP addresses.
resource "digitalocean_vpc" "default" {
  count = var.enable_vpc == true ? 1 : 0

  name        = module.labels.id
  region      = var.region
  description = var.description
  ip_range    = var.ip_ragne
}
