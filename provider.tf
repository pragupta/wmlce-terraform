provider "ibm" {
  version          = ">= 1.2.1"
  ibmcloud_api_key = var.ibmcloud_api_key
  generation       = "2"
  region           = var.vpc_region
}

