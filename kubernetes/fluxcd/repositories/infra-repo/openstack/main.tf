terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.54"
    }
  }
}

# Uses OS_* from env injected by the Kubernetes Secret (no creds here)
provider "openstack" {}

# Variables (we'll set via terraform.tfvars or tf-controller values)
variable "image_id"      { type = string }
variable "flavor_id"     { type = string }
variable "network_id"    { type = string }
variable "keypair_name"  { type = string }

resource "openstack_compute_instance_v2" "vm" {
  name            = "front-test-1"
  image_id        = var.image_id
  flavor_id       = var.flavor_id
  key_pair        = var.keypair_name
  security_groups = ["default"]

  network { uuid = var.network_id }
}
