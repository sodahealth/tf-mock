# Terraform GCP Mock Module

This module demonstrates common GCP resources while using Terraform test mocks so no real infrastructure is created.

Resources defined (and mocked in tests):

- Compute instance
- Firewall rule (allow HTTP)
- Forwarding rule (LB placeholder)
- GCS bucket

## Prerequisites

- Option A: Docker and Docker Compose
- Option B: Terraform >= 1.7.0 installed locally (to run without Docker)

## Quick start (Docker)

With Docker, files are mounted into the container and nothing is copied into the image.

1. Initialize providers (cached in a Docker volume):

```bash
docker compose run --rm tf init
```

1. Run tests:

```bash
docker compose run --rm tf test
```

### Using Make (convenience wrappers)

```bash
make init   # runs: docker compose run --rm tf init
make test   # runs: docker compose run --rm tf test
```

## Quick start (without Docker)

1. Initialize (downloads providers, safe to run without credentials):

```bash
terraform init
```

1. Run tests (uses mocks; does not create real resources):

```bash
terraform test
```
