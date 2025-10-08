terraform {
  required_version = ">= 1.3.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.0, < 6.0"
    }
  }
}

module "cloud_armor_sec_policy" {
  source       = "./cloud_armor_sec_policy"
  project_id   = var.project_id
  log_level    = var.log_level
  json_parsing = var.json_parsing
}