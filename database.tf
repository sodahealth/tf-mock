resource "google_sql_database_instance" "mock_sql" {
  name             = "mysql-instance-1"
  database_version = "POSTGRES_15"
  region           = "us-east4"

  settings {
    tier = "db-f1-micro"
  }
}
