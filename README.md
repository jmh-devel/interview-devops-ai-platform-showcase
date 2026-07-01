# DevOps, AI Platform, and AMI Delivery Showcase

This repository is a sanitized interview/demo artifact. It shows engineering
patterns from production-style work without exposing customer data, hostnames,
credentials, infrastructure coordinates, private benchmark artifacts, or
proprietary implementation details.

## What This Demonstrates

- GitHub Actions release pipelines with peer-review gates, OIDC authentication,
  immutable tags, digest outputs, and deploy-time validation.
- AMI build and validation strategy for Kubernetes-oriented Linux images.
- Terraform module boundaries for marketplace-ready AMI metadata and inference
  lab environments.
- Benchmark reporting discipline for CPU, GPU, and AWS Inferentia-style model
  testing without leaking raw methodology or private infrastructure.
- Monitoring-backed delivery evidence: Prometheus/Grafana/Loki style runtime
  validation and generated billing artifacts from auditable work signals.
- Dashboard-as-code and alert rules for CI/CD build health, security gates,
  release KPIs, rollback signals, and post-deploy validation.
- Consulting communication: explaining why choices were made, where tradeoffs
  were accepted, and what would be improved next.

## Safe Screen Share Path

Open these files in VS Code and keep the Explorer closed:

1. `.github/workflows/quality-gate.yml`
2. `.github/workflows/ami-build-validation.yml`
3. `.github/workflows/reusable-build-publish-image.yml`
4. `terraform/modules/marketplace-ami-metadata/main.tf`
5. `docs/cicd-monitoring-dashboard.md`
6. `monitoring/grafana/cicd-security-gates-dashboard.json`
7. `monitoring/prometheus/cicd-security-gates-rules.yaml`
8. `docs/monitoring-and-billing-loop.md`
9. `benchmarks/summary/model-benchmark-summary.md`
10. `docs/interview-talking-points.md`

## Boundary

The source systems that inspired this showcase contain live infrastructure
state, private network details, access patterns, customer and vendor context,
and unpublished benchmark artifacts. Those are intentionally not included.

## Interview Positioning

The through-line is simple: make platform work repeatable, observable, and
reviewable. The strongest discussion points are not the commands themselves,
but the operating decisions:

- Why use OIDC instead of static credentials?
- Why tag images immutably and surface digests?
- Why test AMIs before promotion?
- Why separate benchmark results from raw infrastructure artifacts?
- Why show sanitized examples rather than live client or company systems?
