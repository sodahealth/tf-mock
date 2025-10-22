resource "google_compute_firewall" "mock_allow" {
  name    = "allow-web-traffic"
  network = "not-default"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server"]
}

resource "google_compute_firewall" "mock_deny" {
  name    = "deny-ssh-traffic"
  network = "not-default"

  deny {
    protocol = "tcp"
    ports    = ["22"]
  }
}

resource "google_compute_forwarding_rule" "mock" {
  name                  = "mock-forwarding-rule"
  region                = var.region
  load_balancing_scheme = "EXTERNAL"
  ip_protocol           = "TCP"
  port_range            = "80"


  target = "projects/${var.project_id}/global/targetHttpProxies/mock-target"
}
