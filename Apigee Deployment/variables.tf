variable "project_id" {
  description = "The GCP Project ID"
  type        = string
  default = "empca-sre-sint-sandbox"
}

variable "analytics_region" {
  description = "Apigee Analytics region (e.g., us-central1)"
  type        = string
  default = "canada-east"
}

variable "environment_name" {
  description = "Apigee environment name"
  type        = string
  default     = "dev"
}