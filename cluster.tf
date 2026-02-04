resource "google_container_cluster" "autopilot" {
  name     = "${var.name}-${var.env}-autopilot"
  location = var.region
  network  = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name

  ip_allocation_policy {
    cluster_secondary_range_name  = "pods"
    services_secondary_range_name = "services"
  }

  release_channel {
    channel = "REGULAR"
  }

  enable_autopilot = true
}

resource "google_compute_global_address" "lb_ip" {
  name = "${var.name}-${var.env}-lb-ip"
}

resource "google_compute_managed_ssl_certificate" "cert" {
  name = "${var.name}-${var.env}-cert"
  managed {
    domains = [var.domain_name]
  }
}