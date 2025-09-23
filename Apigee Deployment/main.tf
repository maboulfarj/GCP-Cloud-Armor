# provider "google" {
#   project = var.project_id
# }

resource "google_apigee_organization" "org" {
  project_id       = var.project_id
  analytics_region = var.analytics_region
  display_name     = "Demo Apigee Org"
}

resource "google_apigee_environment" "env" {
  org_id = google_apigee_organization.org.id
  name   = var.environment_name
  display_name = "Demo Environment"
}
