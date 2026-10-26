
output "vpc_name" {
  description = "Name of the custom VPC"
  value       = google_compute_network.secure_vpc.name
}

output "subnet_name" {
  description = "Name of the private subnet"
  value       = google_compute_subnetwork.secure_subnet.name
}

output "subnet_cidr" {
  description = "Subnet IPv4 range"
  value       = google_compute_subnetwork.secure_subnet.ip_cidr_range
}

output "storage_bucket_name" {
  description = "Name of the private storage bucket"
  value       = google_storage_bucket.secure_bucket.name
}
