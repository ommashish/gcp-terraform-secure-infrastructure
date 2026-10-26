
terraform {
  required_version = ">= 1.5.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

# Custom Virtual Private Cloud
resource "google_compute_network" "secure_vpc" {
  name                    = "secure-lab-vpc"
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
}

# Private subnet for future workloads
resource "google_compute_subnetwork" "secure_subnet" {
  name                     = "secure-lab-subnet"
  region                   = var.region
  network                  = google_compute_network.secure_vpc.id
  ip_cidr_range            = var.subnet_cidr
  private_ip_google_access = true
}

# Permit internal traffic only from the subnet.
# No external SSH or HTTP ingress is allowed by this rule.
resource "google_compute_firewall" "allow_internal" {
  name      = "secure-lab-allow-internal"
  network   = google_compute_network.secure_vpc.name
  direction = "INGRESS"
  priority  = 1000

  source_ranges = [var.subnet_cidr]

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "icmp"
  }
}

# Private bucket for project data
resource "google_storage_bucket" "secure_bucket" {
  name                        = var.bucket_name
  location                    = var.bucket_location
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"
  force_destroy               = false

  versioning {
    enabled = true
  }
}

resource "google_service_account" "app_sa" {
  account_id   = "secure-lab-app"
  display_name = "Secure Lab Application"
  description  = "Dedicated identity for the secure infrastructure lab"
}


resource "google_storage_bucket_iam_member" "app_reader" {
  bucket = google_storage_bucket.secure_bucket.name
  role   = "roles/storage.objectViewer"
  member = "serviceAccount:${google_service_account.app_sa.email}"
}
