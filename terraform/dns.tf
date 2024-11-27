resource "google_dns_managed_zone" "default" {
  name        = "app-zone"
  dns_name    = "${var.domain_name}."
  description = "DNS zone for the application"
}

resource "google_compute_global_address" "default" {
  name = "global-ingress-ip"
}

resource "google_dns_record_set" "default" {
  name         = google_dns_managed_zone.default.dns_name
  type         = "A"
  ttl          = 300
  managed_zone = google_dns_managed_zone.default.name
  rrdatas      = [google_compute_global_address.default.address]
}
