terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.83.0"
    }
  }

  required_version = ">= 0.14"
}

variable "project_id" {
  description = "project id"
}

variable "region" {
  description = "region"
}

locals {
  prefix = "tf-acm"
}

provider "google" {
  project = var.project_id
  region  = var.region
}
