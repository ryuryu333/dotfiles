variable "project_ids" {
  description = "GCP project IDs by logical project name"
  type        = map(string)
  sensitive   = true
}

variable "billing_account_ids" {
  description = "GCP billing account IDs by logical account name"
  type        = map(string)
  sensitive   = true
}
