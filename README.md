# DevOps Task - Sample Repository

**Objective:** Demonstrate a simple CI/CD pipeline using GitHub, Jenkins, Docker, and Cloud deployment (AWS/GCP).

## Repository contents
- `app.js`, `package.json` — simple Node.js Express app.
- `Dockerfile` — multi-stage Dockerfile for production.
- `Jenkinsfile` — declarative pipeline with stages: Checkout, Install & Test, Build Docker Image, Push Image, Deploy.
- `terraform/` — example Terraform to create an AWS ECR repository.
- `deployment-proof/` — placeholder screenshots and instructions.

## Architecture (high-level)
```
[GitHub] --> [Jenkins CI] --> [Docker Registry (DockerHub / AWS ECR)]
                                 |
                                 v
                            [Cloud Run / ECS / GKE]
                                 |
                                 v
                          [Monitoring: CloudWatch / Stackdriver]
```

See `/docs/architecture.png` for a visual diagram.

## Setup instructions (summary)
1. Fork the original sample or use this repo.
2. Create branches: `main` and `dev`. Push code to `dev`, merge to `main` when ready.
3. Jenkins:
   - Install Docker on Jenkins agent or use Docker-in-Docker.
   - Add credentials (Docker registry username/password) in Jenkins credentials store (ID: `docker_registry` suggested).
   - Create a Pipeline job pointing to this repository and enable GitHub webhook.
4. Docker Registry:
   - For DockerHub: create repo `your-docker-username/devops-task-sample`.
   - For AWS ECR: create using Terraform (`terraform init` -> `terraform apply`) or AWS console.
5. Deployment:
   - Use ECS Fargate, Cloud Run or GKE. Replace deploy step in `Jenkinsfile` with infra-specific commands (see WRITEUP.md).
6. Monitoring:
   - For AWS: use CloudWatch Logs and Metrics for ECS/EC2; ensure the task/instance role allows CloudWatch access.
   - For GCP: use Cloud Logging and Monitoring.
7. Testing locally:
   - `npm install`
   - `npm start`
   - Open `http://localhost:8080`

## Pipeline flow explanation
1. Push to GitHub `dev` branch -> GitHub webhook triggers Jenkins.
2. Jenkins pipeline checks out code -> installs dependencies -> runs tests.
3. Builds Docker image -> tags with build number -> pushes to registry.
4. Deployment step updates the cloud service to use the new image.
5. Monitoring collects logs/metrics; you can view them in Cloud console.

## Submission
- Fill the form: https://forms.gle/otmnfQvxiBh4YLW1A
- Include link to your GitHub repository containing these files and `deployment-proof/`.
