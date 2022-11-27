resource "google_compute_subnetwork" "subnet1" {
  name          = "k8s-subnet"
  ip_cidr_range = "10.2.0.0/16"
  region        = "asia-south1"
  private_ip_google_access = true
  network       = google_compute_network.vpc.id
  secondary_ip_range {
    range_name    = "services-range"
    ip_cidr_range = "192.168.1.0/24"
  }

  secondary_ip_range {
    range_name    = "pod-ranges"
    ip_cidr_range = "192.168.64.0/22"
  }
}

resource "google_compute_subnetwork" "subnet2" {
  name          = "db-subnet"
  ip_cidr_range = "10.3.0.0/16"
  region        = "asia-south1"
  private_ip_google_access = true
  network       = google_compute_network.vpc.id
  secondary_ip_range {
    range_name    = "dbs-services-range"
    ip_cidr_range = "192.155.1.0/24"
  }

  secondary_ip_range {
    range_name    = "dbs-pod-ranges"
    ip_cidr_range = "192.158.64.0/22"
  }
}

resource "google_compute_network" "vpc" {
  name                    = "vpc"
  auto_create_subnetworks = false
}