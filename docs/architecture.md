# Architecture Overview

```text
Pull Request
    |
    v
Quality Gate
    |-- formatting and linting
    |-- IaC validation
    |-- secret/policy scanning
    v
Merge To Main
    |
    v
Build Artifact
    |-- container image digest
    |-- candidate AMI
    |-- validation summary
    v
Disposable Test Environment
    |-- boot readiness
    |-- runtime health
    |-- Kubernetes/container checks
    |-- model inference smoke tests
    v
Promotion Review
    |-- immutable artifact reference
    |-- redacted benchmark summary
    |-- rollback notes
    v
Marketplace / Client Delivery Candidate
```

## Design Principles

- Keep credentials out of pipelines through workload identity.
- Promote immutable artifacts, not mutable assumptions.
- Run tests in disposable infrastructure and retain only review-safe summaries.
- Validate the operational contract: boot, runtime, observability, and rollback.
- Treat benchmark publication as a product surface, not as a raw log dump.

## What Is Intentionally Missing

- Live cloud account IDs.
- Private VPC, subnet, route, or host details.
- Customer or vendor names.
- Raw benchmark logs.
- AMI IDs from active environments.
- Secrets, kubeconfigs, tfvars, tfstate, SSH material, and generated keys.

