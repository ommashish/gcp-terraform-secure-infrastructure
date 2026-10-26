
variable "project_id" {
  description = "Your Google Cloud project ID"
  type        = string
}

variable "region" {
  description = "Region for the VPC subnet"
  type        = string
  default     = "us-central1"
}

variable "subnet_cidr" {
  description = "Private IPv4 range for the subnet"
  type        = string
  default     = "10.10.0.0/24"
}

variable "bucket_name" {
  description = "Globally unique name for your private bucket"
  type        = string
}

variable "bucket_location" {
  description = "Cloud Storage bucket location"
  type        = string
  default     = "US-CENTRAL1"
}
