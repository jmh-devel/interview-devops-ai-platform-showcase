# Sanitized Model Benchmark Summary

This is a shareable example of how benchmark results are summarized before
publication or client review. It intentionally avoids raw hostnames, AMI IDs,
private IPs, cloud account IDs, full command transcripts, and unpublished tuning
details.

## Workload Classes

| Workload | Representative Runtime | Why It Matters |
| --- | --- | --- |
| CPU baseline | Open-source LLM smoke prompt on general compute | Establishes cost and latency floor. |
| GPU inference | Open-source model on CUDA-capable instance family | Measures throughput, batching, and driver readiness. |
| Inferentia2 inference | Open-source model compiled/runtime-tested for Neuron | Tests cost/performance and AMI readiness for AWS accelerator users. |
| Boot readiness | Cloud-init, systemd, SSH, container runtime | Validates marketplace AMI operational experience. |

## Example Summary Metrics

| Platform Class | Readiness Result | Relative Throughput | Notes |
| --- | ---: | ---: | --- |
| CPU baseline | Pass | 1.0x | Useful for correctness and regression checks. |
| GPU candidate | Pass | 6-12x | Strong for flexible model/runtime coverage. |
| Inferentia2 candidate | Pass | 8-18x | Best when model/runtime path is stable and compiled artifacts are managed. |

These are illustrative ranges for interview discussion, not raw published
results. Real publication should include model name, quantization, batch shape,
runtime versions, tokenization rules, warmup policy, sample size, and cost basis.

## Why This Format

- Executives and clients need the decision summary first.
- Engineers need enough metadata to reproduce the conclusion.
- Security reviewers need proof that the artifact excludes secrets and private
  infrastructure data.
- Marketplace buyers need confidence that the image was validated on the
  instance families they plan to use.

