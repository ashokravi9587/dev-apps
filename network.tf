resource "google_compute_network" "knetwork" {
  name = "knetwork"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "ksubnet" {
  name = "ksubnet"
  region = var.GCP_KUB_REGION
  ip_cidr_range = "10.128.0.0/20"
  network = google_compute_network.knetwork.id
}

resource "google_compute_firewall" "fw_ssh" {
  name = "fw_allow_ssh22"
  allow {
    port = ["22"]
    protocol = "tcp"
  }
  direction = "INGRESS"
  network = google_compute_network.knetwork.id
  priority = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["ssh-tag"]
}

resource "google_compute_firewall" "fw_http" {
  name = "fw_allow_http80"
  allow {
    ports = ["80"]
    protocol = "tcp"
  }
  direction = "INGRESS"
  network = google_compute_network.knetwork.id
  priority = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["webserver-tag"]
}