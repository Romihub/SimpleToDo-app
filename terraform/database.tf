resource "google_sql_database_instance" "postgres" {
  name             = "postgres-instance"
  database_version = "POSTGRES_14"
  region           = var.region

  settings {
    tier = "db-f1-micro"

    ip_configuration {
      ipv4_enabled = true
      authorized_networks {
        name  = "gke-cluster"
        value = "0.0.0.0/0" # In production, restrict this to GKE cluster IP
      }
    }

    backup_configuration {
      enabled = true
    }
  }

  deletion_protection = false
}

resource "google_sql_database" "database" {
  name     = "app-database"
  instance = google_sql_database_instance.postgres.name
}

resource "google_sql_user" "user" {
  name     = "app-user"
  instance = google_sql_database_instance.postgres.name
  password = var.db_password
}
