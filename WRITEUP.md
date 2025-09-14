# Write-up

## Tools & Services used
- GitHub (source control)
- Jenkins (CI/CD)
- Docker (containerization)
- DockerHub or AWS ECR (image registry)
- AWS ECS / GCP Cloud Run / GKE (deployment options)
- Terraform (Infrastructure as Code - example included)
- CloudWatch / Cloud Logging (monitoring & logging)

## Challenges faced & Solutions
- Credential management between Jenkins and registry: use Jenkins credentials and avoid hardcoding secrets.
- Network/permissions for cloud deploys: use appropriate IAM roles and service accounts for automation.
- Keeping image sizes small: multi-stage Dockerfile used to reduce final image size.

## Possible improvements
- Add automated integration tests and security scanning (e.g., Snyk, Trivy).
- Use GitHub Actions as alternative CI for simpler setups.
- Automate Terraform via Jenkins with state locked in S3 + DynamoDB (for AWS).
