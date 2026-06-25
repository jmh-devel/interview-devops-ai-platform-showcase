terraform {
  required_version = ">= 1.6.0"
}

variable "instance_family" {
  description = "Accelerator or CPU family being validated."
  type        = string
  default     = "inf2"
}

variable "model_profile" {
  description = "Sanitized model workload profile."
  type        = string
  default     = "open-source-llm-inference-smoke"
}

locals {
  lab_contract = {
    workload_profile = var.model_profile
    instance_family  = var.instance_family
    captures = [
      "time_to_ready",
      "tokens_per_second",
      "p95_latency_ms",
      "cost_per_1m_tokens_estimate",
      "driver_runtime_health",
    ]
    redaction_policy = "retain summaries only; discard raw instance metadata and private logs"
  }
}

output "lab_contract" {
  value = local.lab_contract
}

