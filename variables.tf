variable "basename" {
  description = "Denotes the name of the VPC to deploy into. Resources associated will be prepended with this name."
  default = "wmlce-gpu"
}

variable "boot_image_name" {
  description = "name of the base image for the virtual server (should be an Ubuntu 18.04 base)"
  default = "ibm-ubuntu-18-04-3-minimal-ppc64le-2"
}

variable "vpc_region" {
  description = "Target region to create this instance"
  default = "us-south"
}

variable "vpc_zone" {
  description = "Target availbility zone to create this instance"
  default = "us-south-3"
}

variable "vm_profile" {
  description = "What resources or VM profile should we create for compute? Default is 2 GPUs, 24 vCPUs, 224G memory, 72Gbps Network"
  default = "cp2-2x4"
 # default = "gp2-8x64x2"
#  default = "gp2-24x224x2"
}

variable "wmlce_version" {
  description = "Watson Machine Learning Community Edition (WMLCE) version to install"
  default = "1.7.0"
}

variable "python_version" {
  description = "python version to install for WMLCE frameworks"
  default = "3.7"
}

variable "ibmcloud_api_key" {
    description = "Denotes the IBM Cloud API key to use"
}
