output "kubernetes_cluster_name" {
  value = google_container_cluster.primary.name
}

output "kubernetes_cluster_host" {
  value = google_container_cluster.primary.endpoint
}

output "database_instance_connection_name" {
  value = google_sql_database_instance.postgres.connection_name
}

output "database_instance_ip" {
  value = google_sql_database_instance.postgres.ip_address.0.ip_address
}

output "load_balancer_ip" {
  value = google_compute_global_address.default.address
}
