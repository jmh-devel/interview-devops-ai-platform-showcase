terraform {
  required_version = ">= 1.6.0"
}

variable "product_name" {
  description = "Marketplace-facing product name."
  type        = string
}

variable "candidate_ami_id" {
  description = "Candidate AMI identifier. Use a non-production value in demos."
  type        = string
}

variable "validation_summary_path" {
  description = "Path to the redacted validation summary used for release review."
  type        = string
}

variable "supported_instance_families" {
  description = "Instance families validated for this image."
  type        = list(string)
  default     = ["c7i", "g6", "inf2"]
}

locals {
  release_metadata = {
    product_name                = var.product_name
    candidate_ami_id            = var.candidate_ami_id
    validation_summary_path     = var.validation_summary_path
    supported_instance_families = var.supported_instance_families
    release_channel             = "candidate"
  }
}

output "release_metadata" {
  description = "Sanitized release metadata suitable for review."
  value       = local.release_metadata
}

