resource "google_container_cluster" "gke_cluster" {
  name               = "gke-cluster"
  location           = "asia-south1-a"
  initial_node_count = 1
  remove_default_node_pool   = true

  network    = google_compute_network.vpc.id
  subnetwork = google_compute_subnetwork.subnet1.id

  master_authorized_networks_config {
  }

  private_cluster_config {
      enable_private_endpoint    = true
      enable_private_nodes       = true
      master_ipv4_cidr_block     = "172.16.0.0/28"
  }
  
  
  ip_allocation_policy {
    cluster_secondary_range_name  = "services-range"
    services_secondary_range_name = google_compute_subnetwork.subnet1.secondary_ip_range.1.range_name
  }

  # other settings...
}
resource "google_container_node_pool" "linux_pool" {
  name               = "linux-pool"
  cluster            = google_container_cluster.gke_cluster.name
  location           = google_container_cluster.gke_cluster.location
  node_count         = 1

  node_config {
    image_type   = "COS_CONTAINERD"
    
  }
}
