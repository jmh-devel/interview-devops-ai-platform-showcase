# CI/CD Monitoring Dashboard

This directory adds a concrete, screen-share-safe monitoring artifact for the
DevOps interview loop: codified change, peer review, security gates, CD,
runtime validation, and release reporting.

The dashboard is intentionally generic. It does not require exposing any live
client systems, private repositories, hostnames, credentials, account IDs, or
raw incident data.

## Files

- `monitoring/grafana/cicd-security-gates-dashboard.json`
  - Grafana dashboard-as-code for build health, release flow, security gates,
    Terraform/IaC policy checks, container findings, rollback signals, and
    post-deploy validation.
- `monitoring/prometheus/cicd-security-gates-rules.yaml`
  - Prometheus recording and alerting rules for the same KPI set.

## KPI Story

The point of this dashboard is not a pretty chart. The point is the operating
discipline:

1. A change is codified in Terraform, Helm, Kubernetes manifests, workflow code,
   or application code.
2. Pull request checks run format, policy, secret, dependency, image, and test
   gates.
3. CD promotes only reviewed, immutable artifacts.
4. Post-deploy validation checks Kubernetes readiness, Prometheus target health,
   service smoke checks, SLO-style signals, and rollback state.
5. Release completion is backed by monitoring evidence instead of optimism.

This is the exact conversation thread to use in an interview:

> "I do not consider a release complete when a workflow says the deploy command
> exited zero. A release is complete when the deployed state is observable, the
> security gates are clean or explicitly waived, and post-deploy validation has
> passed."

## Dashboard Panels

| Panel | Why it matters |
| --- | --- |
| Build Success Rate | Shows CI quality and whether engineers can trust the pipeline. |
| Security Gate Pass Rate | Shows whether secret scanning, IaC policy, image scanning, and dependency checks are blocking unsafe changes. |
| Release Validation Pass Rate | Shows whether deployed changes pass runtime validation after CD. |
| Successful Releases / 24h | Shows deployment frequency and release throughput. |
| Build Duration p95 | Shows whether quality gates are becoming too slow for developers to use. |
| Lead Time For Changes p95 | Shows delivery flow from change to validated release. |
| Security Gate Failures by Gate | Makes failures actionable by gate type instead of hiding them in workflow logs. |
| IaC Policy Violations | Maps directly to Terraform/Kubernetes governance and security posture. |
| Critical and High Container Findings | Keeps artifact promotion tied to image risk. |
| Post-Deploy Validation Failures | Separates "deploy command succeeded" from "release is actually healthy." |
| Rollbacks by Service | Gives a release-quality counterweight to deployment frequency. |
| Latest Non-Success Workflow Runs | Helps reviewers jump from KPI symptoms to the affected workflow class. |

## Metric Contract

The dashboard assumes a CI/CD exporter, GitHub Actions/GitLab/Jenkins collector,
or OpenTelemetry collector emits these generic Prometheus metrics:

| Metric | Type | Important labels |
| --- | --- | --- |
| `cicd_builds_total` | counter | `repository`, `workflow`, `branch`, `status` |
| `cicd_build_duration_seconds_bucket` | histogram | `repository`, `workflow`, `le` |
| `cicd_security_gate_checks_total` | counter | `repository`, `workflow`, `gate`, `status` |
| `cicd_iac_policy_violations_total` | counter | `repository`, `tool`, `severity` |
| `cicd_container_vulnerabilities` | gauge | `repository`, `image`, `severity` |
| `cicd_releases_total` | counter | `repository`, `environment`, `service`, `status` |
| `cicd_release_rollbacks_total` | counter | `repository`, `environment`, `service` |
| `cicd_deployment_validation_total` | counter | `repository`, `environment`, `service`, `check`, `status` |
| `cicd_lead_time_seconds_bucket` | histogram | `repository`, `environment`, `le` |
| `cicd_workflow_run_info` | gauge/info | `repository`, `workflow`, `branch`, `conclusion` |

The metric names are deliberately platform-neutral. In a real client
environment, these could be populated from GitHub Actions API polling,
GitLab/Jenkins exporters, Argo CD notifications, deployment webhooks,
OpenTelemetry spans, Prometheus Pushgateway for short-lived jobs, or a small
collector that normalizes workflow events into these labels.

## Security Gate Examples

Good security gates to discuss while showing this dashboard:

- Terraform formatting and validation.
- IaC policy checks with Checkov, tfsec, OPA/Conftest, Kyverno, or equivalent.
- Secret scanning before merge and before artifact publication.
- Dependency and SBOM checks.
- Container vulnerability scanning with critical/high promotion thresholds.
- Immutable image references and digest-based promotion.
- OIDC/workload identity instead of static CI credentials.
- Post-deploy checks that verify Kubernetes readiness and Prometheus target
  health before declaring the release complete.

## Review / Quality Checklist

Use this checklist before presenting the dashboard:

- The dashboard is checked in as JSON, not manually edited in a live Grafana UI.
- Alerting rules are checked in next to the dashboard.
- Metrics are generic and sanitized.
- No client hostnames, repository secrets, account IDs, private service names,
  or raw incident details are present.
- Every KPI has an operational decision attached to it.
- Failures are actionable by gate, workflow, service, or environment.
- Release health is measured after deployment, not only during CI.

## Validation Commands

```bash
jq empty monitoring/grafana/cicd-security-gates-dashboard.json
python - <<'PY'
import yaml
with open("monitoring/prometheus/cicd-security-gates-rules.yaml", "r", encoding="utf-8") as f:
    yaml.safe_load(f)
PY
promtool check rules monitoring/prometheus/cicd-security-gates-rules.yaml
```

`promtool` is the strongest validation for Prometheus semantics. The JSON and
YAML checks validate syntax only.

## Interview Talk Track

Use this short version:

> "This dashboard is the concrete monitoring side of the delivery loop. It shows
> CI health, security gate quality, release frequency, lead time, rollback risk,
> and post-deploy validation. I would wire it to GitHub Actions, Jenkins, GitLab,
> Argo CD, or a small OpenTelemetry collector depending on the client. The key is
> that the dashboard and alerts are codified and reviewed just like Terraform or
> Kubernetes manifests."

Then connect it to the earlier repo material:

> "The workflow files show how I would create reviewed and immutable artifacts.
> This dashboard shows how I would prove those artifacts are being promoted
> safely and validated after deployment."
