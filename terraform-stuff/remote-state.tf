terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "dudatuta-labs"

    workspaces {
      name = "Lero-Lero"
    }
  }
}