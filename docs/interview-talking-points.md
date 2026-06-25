# Interview Talking Points

## Opening Frame

"I prepared a sanitized repository rather than sharing live company or client
systems. The code shows the patterns and decisions, but it deliberately excludes
hostnames, credentials, account IDs, private network topology, raw benchmark
artifacts, and proprietary tuning details."

## BiModal Fit

BiModal's material emphasizes DevOps, DevSecOps, Kubernetes, Terraform, peer
review, CD, validation, monitoring, and client communication. This showcase maps
directly to those themes:

- Everything is codified.
- Changes are peer-reviewable.
- Credentials are designed around OIDC/workload identity, not static keys.
- Release artifacts are immutable where possible.
- Deployment or AMI promotion requires validation, not optimism.
- Benchmark summaries are separated from raw operational artifacts.

## What We Did And Why

### CI/CD and Release Promotion

The key decision was to make release promotion deterministic. Instead of letting
every merge trigger a blind full redeploy, the workflow identifies changed
surfaces, builds only what changed, emits immutable image references, and runs
post-promotion smoke checks.

Why:

- Reduce blast radius.
- Keep deploys fast enough that teams actually use them.
- Preserve auditability from commit to artifact to runtime.
- Avoid mutable "latest" becoming the only release record.

### AMI Build and Validation

The AMI workflow treats images like release artifacts. A candidate image is
built from a known upstream base, validated in disposable infrastructure, tagged
only after passing boot/runtime/security checks, and summarized for review.

Why:

- Marketplace users judge images by first boot experience.
- Broken cloud-init, SSH, drivers, or container runtime support destroys trust.
- Accelerator images need more than package installation; they need workload
  validation on the target instance families.

### AI Accelerator Benchmarking

For GPU and Inferentia2-style testing, the goal is not just "can the model run?"
It is whether the image gives a predictable path from boot to useful inference.

Validation dimensions:

- Time to ready.
- Driver/runtime health.
- Model load success.
- Tokens per second.
- Tail latency.
- Cost-per-work estimate.
- Failure modes and recovery notes.

The safe sharing boundary is to discuss open-source models, benchmark shape, and
summary findings while withholding unpublished tuning methodology, private
environment details, and raw logs.

## Leadership Stories

### CIQ: Building Delivery Discipline

At CIQ, I helped build Solutions Delivery Engineering from an early state into a
repeatable delivery function. The work was not only technical; it included
screening/hiring, mentoring engineers, building reusable patterns, and turning
recurring customer pain into automation and documentation.

Strong angle:

"The leadership lesson was that senior engineers have to convert ambiguity into
operating systems. If every delivery depends on the one person who remembers the
steps, the team has not really solved the problem."

### Conflict With Platform Engineers

When platform teams disagreed on implementation direction, the productive move
was to move the conversation from opinion to operating criteria: blast radius,
rollback path, supportability, security posture, and time-to-value.

Strong angle:

"I try not to win architecture arguments by volume. I try to make the tradeoffs
explicit enough that the right answer becomes easier for the team to choose."

### Secure Image Diffing For A Top-Card-Network Fintech Client

For enterprise image work, especially bootc-style delivery, the important
decision is to treat the OS image as a tested supply-chain artifact rather than
as a server someone manually fixed over time.

Strong angle:

"For a leading fintech client associated with one of the top four card networks,
we had a gap that normal image inventory did not solve: they needed to know not
just what was in an image, but what changed from build to build. I built an image
forensics and diffing mechanism that CIQ and the client adopted as a missing
auditability layer in the secure supply chain."

Why it mattered:

- SBOM-style inventory answers "what is present?"
- Image diffing answers "what changed?"
- Security and platform teams can review deltas instead of re-auditing an entire
  artifact from scratch.
- Promotion becomes evidence-driven instead of trust-driven.

### Ansys HPC Time-To-Ready Reduction

Ansys is a named example I can discuss directly. The problem was expensive HPC
capacity sitting idle during post-launch setup. Instances needed NVIDIA and
workload readiness work before users could do useful compute.

Strong angle:

"For Ansys, I helped move the setup work into baked, validated images using the
same repositories and approved package sources they were already using. That
dropped massive-scale HPC instance time-to-ready from roughly 45 minutes to
under 1 minute. At their scale, that is not just a convenience improvement; it
is potentially millions of dollars in avoided idle compute waste."

Why it mattered:

- Existing approved sources were preserved, reducing process friction.
- Runtime bootstrap moved into controlled image build validation.
- Users reached productive compute faster.
- The cost win scaled with instance count and accelerator/HPC hourly cost.

## Questions To Ask Them

- "How do you expect consultants to balance client-specific standards with
  opinionated platform patterns?"
- "For Kubernetes and Terraform work, what does your team consider a good
  validation gate before client deployment?"
- "How much of the role is hands-on delivery versus leading elastic engineers?"
- "When you evaluate screen shares, are you mainly looking for code depth,
  operational judgment, or consulting communication?"

## Boundary Statement

"I am happy to explain design choices and sanitized implementation patterns, but
I will not expose live client systems, credentials, private infrastructure
coordinates, or unpublished benchmark methodology over screen share. That is the
same boundary I would protect for your clients."
