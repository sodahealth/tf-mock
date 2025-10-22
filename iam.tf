// This mock-group should have all the access needed to be a bigquery user.
// - able to connect
// - be a bigquery user
// - be a bigquery data editor
// this can be done in a single resource (no custom roles)
resource "google_project_iam_member" "mock_for_loop" {
  project = var.project_id
  role    = "roles/wrong-role"
  member  = "group:mock-group@mock-project.com"
}
