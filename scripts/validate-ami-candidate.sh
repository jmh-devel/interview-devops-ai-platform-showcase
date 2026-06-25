#!/usr/bin/env bash
set -euo pipefail

candidate_ami="${1:-}"

if [[ -z "$candidate_ami" ]]; then
  echo "Usage: $0 <candidate-ami-id>" >&2
  exit 2
fi

cat <<REPORT
AMI validation plan for ${candidate_ami}

1. Launch isolated test instance in a disposable VPC.
2. Wait for SSH and cloud-init readiness.
3. Capture boot timing, failed systemd units, kernel version, and security posture.
4. Validate container runtime, Kubernetes agent readiness, and accelerator drivers.
5. Run representative CPU/GPU/Inferentia smoke benchmarks.
6. Destroy test infrastructure and retain only redacted summary artifacts.
REPORT

