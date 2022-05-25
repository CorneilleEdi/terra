terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.22.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.project_region
}

locals {
  cors = [
    {
      origin = ["https://google.com"]
      method = ["GET"]
    },
    {
      origin = ["https://loopbin.dev"]
      method = ["GET", "HEAD", "PUT", "POST", "DELETE"]
    }
  ]
}

resource "google_storage_bucket" "images_bucket" {
  name                        = "workstorm-flex-images"
  force_destroy               = true
  uniform_bucket_level_access = false
  location                    = var.project_region

  dynamic "cors" {
    for_each = local.cors
    content {
      origin          = cors.value.origin
      method          = cors.value.method
      response_header = ["*"]
      max_age_seconds = 3600
    }
  }

  /*  cors {
      origin          = ["https://google.com"]
      method          = ["GET"]
      response_header = ["*"]
      max_age_seconds = 3600
    }
    cors {
      origin          = ["https://loopbin.dev"]
      method          = ["GET", "HEAD", "PUT", "POST", "DELETE"]
      response_header = ["*"]
      max_age_seconds = 3600
    }*/
}