# DevOps

Space for our IaC definitions and deployment pipelines.

## Terraform definitions for GCP

### Prerequisites

To do after creating a new GCP project:

1. Create a service account and generate json key.
2. Enable APIs:
   - _Cloud Resource Manager API_
   - _Kubernetes Engine API_
3. Create GitHub Actions secrets:
   - `GOOGLE_CREDENTIALS` storing service account's json key
   - `GOOGLE_PROJECT_ID` storing GCP project's id
   - `GOOGLE_REGION` storing a default GCP region
   - `GOOGLE_ZONE` storing a default GCP zone

### Workflows

GitHub Actions workflows in this repository:

- `GCP Environment` creates/destroys GCP resources.

## Continues Deployment on Kubernetes

![image](https://github.com/MLOps-KNDS/devops/assets/30211831/280a0cb2-8442-4b22-8494-a6dd059fbcdc)
