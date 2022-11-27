resource "google_sql_database" "database" {
  name     = "application-database"
  instance = google_sql_database_instance.instance.name
}
resource "google_sql_database_instance" "instance" {
  name             = "application-instance"
  region           = "asia-south1"
  database_version = "MYSQL_8_0"

  depends_on = [google_service_networking_connection.private_vpc_connection]
  
  settings {
    tier = "db-f1-micro"
    ip_configuration {
      ipv4_enabled    = false
      private_network = google_compute_network.vpc.id
    }
  }

  deletion_protection  = "true"
}

provider "google-beta" {
  region = "asia-south1"
  zone   = "asia-south1-a"
}