locals {
  projects = {
    ga-analysis = {
      name                = "ga-analysis-tf"
      billing_account     = "main"
      auto_create_network = true
      deletion_policy     = "PREVENT"
    }
    certain-song = {
      name                = "My Project 82587"
      billing_account     = null
      auto_create_network = true
      deletion_policy     = "PREVENT"
    }
  }
}

resource "google_project" "projects" {
  for_each = local.projects

  name                = each.value.name
  project_id          = var.project_ids[each.key]
  billing_account     = each.value.billing_account == null ? null : var.billing_account_ids[each.value.billing_account]
  auto_create_network = each.value.auto_create_network
  deletion_policy     = each.value.deletion_policy
}
