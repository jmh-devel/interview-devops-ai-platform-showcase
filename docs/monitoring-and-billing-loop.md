# Monitoring And Billing Loop

This is the shortest safe path for the BiModal discussion: codified change,
reviewed change, deployed change, observed change, then operational evidence
that can support accurate client reporting and billing.

## Closed-Loop Delivery

The operating pattern is:

1. Change is codified in Terraform, Helm, Kubernetes manifests, or workflow code.
2. Pull request checks run formatting, policy, secret, and validation gates.
3. CD promotes only reviewed, immutable artifacts.
4. Runtime evidence is collected through Prometheus, Grafana, Loki, and
   Kubernetes health signals.
5. Delivery reports and invoices are generated from auditable activity evidence,
   not memory or vague weekly summaries.

The important point for a client is that "done" is not just a merge. Done means
the deployed state is observable and the business record can be traced back to
engineering activity.

## Monitoring Evidence

A production-style monitoring stack should be codified the same way as
application infrastructure:

- Helm values define Prometheus, Grafana, Alertmanager, Loki, Promtail,
  node-exporter, and kube-state-metrics.
- Production values set retention, persistent storage, resource requests,
  liveness/readiness behavior, and security context.
- Grafana dashboards are checked in as JSON or ConfigMaps so dashboard behavior
  can be reviewed and promoted like application code.
- Post-deploy validation uses Kubernetes readiness, Prometheus targets, service
  health, logs, and dashboard signals before calling a release complete.

Screen-share-safe examples to discuss:

- A Kubernetes health dashboard validates cluster/node/pod state after changes.
- A log dashboard lets operators correlate deployment events with runtime errors.
- A time-tracking dashboard aggregates activity by project and hour, with
  Athena/Grafana used for review rather than manual reconstruction.

## Billing Evidence

The billing workflow is a CI/CD/RO-style pipeline for professional services:

- Raw activity signals come from local activity tracking, git history, explicit
  issue references, and automation/agent run metadata.
- The journal generator classifies project work, rounds billable time in
  transparent 15-minute blocks, and writes Markdown receipts.
- Weekly automation produces a period summary, invoice source, compact invoice,
  and PDF-ready artifact.
- Tests cover invoice parsing, daily/weekly automation, cron cadence, artifact
  discovery, and billing email composition.

This gives a client a forensic billing model:

- what changed
- when the work happened
- which project/context produced the signal
- which commits/issues support the work
- how the invoice total was calculated

## Interview Framing

Use this exact framing:

"BiModal's material says Terraform and Kubernetes changes should be codified,
peer reviewed, deployed through CD, and validated through monitoring. I use the
same principle for client delivery evidence. The platform validates runtime
state, and the billing pipeline validates professional-services time against
activity, commits, issues, and generated artifacts."

Then keep the example high-level:

"I would not expose live client dashboards in an interview, but the pattern is
straightforward: Prometheus/Grafana/Loki for runtime truth, GitHub/Terraform/Helm
for change truth, and a generated time-journal/invoice bundle for billing truth."

## Boundary

Do not show live dashboards, live hostnames, credentials, raw private activity
logs, customer names, or unpublished billing records. Show sanitized structure,
tests, and generated-example shape instead.
