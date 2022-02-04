terraform {
  required_version = ">= 1.0.0"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

variable "do_token" {}

resource "digitalocean_droplet" "terramino" {
  image     = "ubuntu-20-04-x64"
  name      = "terramino"
  region    = "fra1"
  size      = "s-1vcpu-1gb"
  user_data = file("terramino_app.yaml")
}
