mock_provider "google" {
  mock_resource "google_storage_bucket" {
    defaults = {
      url = "https://storage.googleapis.com/mock-bucket"
    }
  }
}

run "plan_with_mocks" {
  command = apply

  variables  {
    project_id   = "mock-project"
    region       = "us-central1"
  }

  assert {
    condition     = google_storage_bucket.mock.name == "mock-bucket"
    error_message = "incorrect bucket name"
  }

  assert {
    condition     = google_storage_bucket.mock.url == "https://storage.googleapis.com/mock-bucket"
    error_message = "Bucket URL should match mocked value"
  }

  assert {
    condition     = google_compute_instance.mock.name == "mock-instance"
    error_message = "Instance name should match mocked value"
  }

  assert {
    condition     = contains(google_compute_instance.mock.tags, "web-server")
    error_message = "instance should have 'web-server' tag"
  }

  assert {
    condition     = google_compute_firewall.mock_allow.name == "allow-web-traffic"
    error_message = "Firewall name should match mocked value"
  }

  assert {
    condition     = google_compute_firewall.mock_allow.network == "not-default"
    error_message = "Firewall network should use 'not-default' network"  
  }

  assert {
    condition     = anytrue([for a in google_compute_firewall.mock_allow.allow : a.protocol == "tcp"]) 
    error_message = "Firewall should allow TCP traffic"
  }

  assert {
    condition     = anytrue([for a in google_compute_firewall.mock_allow.allow : contains(a.ports, "80")])
    error_message = "Firewall should allow http port 80 traffic"
  }

  assert {
    condition     = anytrue([for a in google_compute_firewall.mock_allow.allow : contains(a.ports, "443")])
    error_message = "Firewall should allow http port 443 traffic"
  }

  assert {
    condition     = anytrue([for s in google_compute_firewall.mock_allow.source_ranges : s == "0.0.0.0/0"]) 
    error_message = "Firewall should allow traffic from all sources"
  }

  assert {
    condition     = anytrue([for t in google_compute_firewall.mock_allow.target_tags : t == "web-server"]) 
    error_message = "Firewall target tag should be 'web-server'"
  }

  assert {
    condition     = anytrue([for d in google_compute_firewall.mock_deny.deny : d.protocol == "tcp"]) 
    error_message = "Firewall should deny TCP traffic"
  }

  assert {
    condition     = anytrue([for d in google_compute_firewall.mock_deny.deny : contains(d.ports, "22")])
    error_message = "Firewall should deny SSH traffic"
  }

  assert {
    condition     = anytrue([for d in google_compute_firewall.mock_deny.deny : contains(d.ports, "3389")])
    error_message = "Firewall should deny RDP traffic"
  }

  assert {
    condition     = google_compute_forwarding_rule.mock.name == "mock-forwarding-rule"
    error_message = "Forwarding rule name should match mocked value"
  }

  assert {
    condition     = google_sql_database_instance.mock_sql.name == "postgres-instance-1"
    error_message = "SQL instance name should match mocked value"
  }

  assert {
    condition     = google_sql_database_instance.mock_sql.database_version == "POSTGRES_17"
    error_message = "SQL instance database version should match mocked value"
  }

  assert {
    condition     = google_sql_database_instance.mock_sql.region == "us-central1"
    error_message = "SQL instance region should match mocked value"
  }

assert {
  condition     = contains(google_project_iam_member.mock_for_loop, "roles/bigquery.connectionUser")
  error_message = "Project IAM member should have 'roles/bigquery.connectionUser' role"
}

assert {
  condition     = contains(google_project_iam_member.mock_for_loop, "roles/bigquery.user")
  error_message = "Project IAM member should have 'roles/bigquery.user' role"
}

assert {
  condition     = contains(google_project_iam_member.mock_for_loop, "roles/bigquery.dataEditor")
  error_message = "Project IAM member should have 'roles/bigquery.dataEditor' role"
}


}


