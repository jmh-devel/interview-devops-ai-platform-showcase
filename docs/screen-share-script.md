# Screen Share Script

## Before Sharing

- Share only the VS Code window for this repository.
- Close the terminal, Explorer, notifications, browser, email, and chat.
- Ask: "Please turn recording off for the screen-share portion."
- Keep all tabs pre-opened.

## Sequence

1. `README.md`
   - Explain the sanitized boundary.
   - State that this mirrors how you would protect client IP.

2. `.github/workflows/quality-gate.yml`
   - PR review gate.
   - IaC formatting.
   - Secret scanning and policy checks.

3. `.github/workflows/ami-build-validation.yml`
   - Upstream freshness check.
   - Candidate build.
   - Disposable validation.
   - Promotion metadata only after success.

4. `.github/workflows/reusable-build-publish-image.yml`
   - OIDC.
   - Immutable tags.
   - Digest references.
   - Reusable workflow contract.

5. `docs/cicd-monitoring-dashboard.md`
   - Concrete monitoring-as-code artifact.
   - CI/CD KPIs: build success, lead time, deployment frequency, rollback rate.
   - Security gate KPIs: secrets, IaC policy, container scan, dependency scan.
   - Post-deploy validation as the release-complete signal.

6. `monitoring/grafana/cicd-security-gates-dashboard.json`
   - Grafana dashboard JSON checked into the repo.
   - Shows dashboard-as-code rather than a live private dashboard.

7. `monitoring/prometheus/cicd-security-gates-rules.yaml`
   - Recording rules for delivery KPIs.
   - Alerts for failed security gates, critical image findings, IaC violations,
     rollback events, and failed post-deploy validation.

8. `docs/monitoring-and-billing-loop.md`
   - Runtime validation through monitoring.
   - Grafana/Athena-style time evidence.
   - Generated billing artifacts from auditable activity signals.
   - Keep this as architecture and process; do not open live dashboards.

9. `benchmarks/summary/model-benchmark-summary.md`
   - Explain open-source model benchmark classes.
   - Keep raw methodology and private results out of scope.

10. `docs/interview-talking-points.md`
    - CIQ leadership.
    - Platform conflict handling.
    - Secure fintech image diffing.
    - Ansys HPC time-to-ready reduction.

## If Pressed For Live Code

"This is the code I prepared to share. The live systems contain customer,
infrastructure, and proprietary details. I can go deeper on the decisions, but I
will not expose those systems in an interview screen share."
