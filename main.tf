provider "google-beta" {
  project = var.project
  region  = var.region
}

resource "google_cloud_run_service" "default" {
  name     = "calibre"
  location = var.region
  provider = "google-beta"

  metadata {
    namespace = var.project
  }

  spec {
    containers {
      image = var.image

      resources {
        limits = map("memory", "350")
      }
    }
  }
}

# The Service is ready to be used when the "Ready" condition is True
# Due to Terraform and API limitations this is best accessed through a local variable
locals {
  cloud_run_status = {
    for cond in google_cloud_run_service.default.status[0].conditions :
    cond.type => cond.status
  }
}