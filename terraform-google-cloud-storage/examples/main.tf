
module "bucket" {
  source = "../modules/cloud_storage_bucket"

  name       = "${var.project_id}-bucket"
  project_id = var.project_id
  location   = "us-east1"

  lifecycle_rules = [{
    action = {
      type = "Delete"
    }
    condition = {
      age        = 365
      with_state = "ANY"
    }
  }]

  iam_members = [{
    role   = "roles/storage.objectViewer"
    member = "group:test-gcp-ops@test.infra.cft.tips"
  }]
}


# module "bucket" {
#   source = "../modules/cloud_storage_bucket"
#   version = "~> 1.3"

#   name       = "example-bucket"
#   project_id = "example-project"
#   location   = "us-east1"
#   iam_members = [{
#     role   = "roles/storage.objectViewer"
#     member = "user:example-user@example.com"
#   }]
# }
