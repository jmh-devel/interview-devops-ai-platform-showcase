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

5. `benchmarks/summary/model-benchmark-summary.md`
   - Explain open-source model benchmark classes.
   - Keep raw methodology and private results out of scope.

6. `docs/interview-talking-points.md`
   - CIQ leadership.
   - Platform conflict handling.
   - Visa/bootc image framing.

## If Pressed For Live Code

"This is the code I prepared to share. The live systems contain customer,
infrastructure, and proprietary details. I can go deeper on the decisions, but I
will not expose those systems in an interview screen share."

