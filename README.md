# Cloud Engineering Take-Home Assignment

## Features

- **REST API** that returns the current time in JSON format.
- **Containerized** application using Docker.
- **Terraform-managed infrastructure**, including:
  - GKE Cluster
  - NAT Gateway for secure outbound traffic
  - VPC networking, subnets, and firewall rules
  - IAM roles and security policies
  - Kubernetes resources (Namespaces, Deployments, Services, Ingress, ConfigMaps)
- **GitHub Actions CI/CD pipeline** that automates:
  - Infrastructure provisioning with Terraform
  - Docker image building and pushing
  - Deployment to GKE
  - API endpoint testing
- **Security best practices** with Terraform Policy as Code (PaC).

## Tech Stack

- **Cloud Provider:** Google Cloud Platform (GCP)
- **Infrastructure as Code:** Terraform
- **Containerization:** Docker
- **Orchestration:** Kubernetes (GKE)
- **CI/CD:** GitHub Actions
- **Networking:** VPC, NAT Gateway, Firewall Rules
- **Security:** IAM, Terraform Policy as Code
- **Monitoring:** Google Cloud Monitoring (optional bonus)

## Infrastructure Setup

The entire infrastructure is provisioned using **Terraform** and includes:

1. **Google Kubernetes Engine (GKE) Cluster**
2. **VPC & Subnets** for secure networking
3. **NAT Gateway** for managing egress traffic
4. **IAM Roles & Policies** for access control
5. **Kubernetes Resources**:
   - **Namespaces**
   - **Deployments** (API Pods)
   - **Services** (LoadBalancer for API exposure)
   - **Ingress** (Optional: Nginx for traffic routing)
   - **ConfigMaps** (Configuration management)

## Deployment Workflow

1. **Terraform Apply** - Provisions GCP infrastructure and GKE resources.
2. **Docker Build & Push** - Builds the API Docker image and pushes it to a container registry.
3. **Kubernetes Deployment** - Deploys the application to GKE.
4. **API Testing** - Runs a test to verify that the API endpoint is accessible.

## Running Locally

### Prerequisites

- Install **Terraform**: `https://developer.hashicorp.com/terraform/downloads`
- Install **Docker**: `https://docs.docker.com/get-docker/`
- Install **kubectl**: `https://kubernetes.io/docs/tasks/tools/`
- Configure **GCP credentials**: `gcloud auth application-default login`

### Steps

1. Clone the repository:
   ```sh
   git clone https://github.com/your-repo.git
   cd your-repo
   ```
2. Initialize Terraform and create infrastructure:
   ```sh
   terraform init
   terraform apply -auto-approve
   ```
3. Build and run the API locally:
   ```sh
   docker build -t my-api .
   docker run -p 8080:8080 my-api
   ```
4. Test the API:
   ```sh
   curl http://localhost:8080/time
   ```


## Deliverables

- **GitHub Repository:** [Your Repo Link]
- **Deployed API Endpoint:** [Your API URL]
- **GitHub Actions Run:** [Your Workflow URL]

## Security Considerations

- **IAM Role Restrictions** to prevent excessive privileges.
- **Firewall Rules** to restrict inbound traffic.
- **NAT Gateway** to manage egress traffic securely.
- **Terraform Policy as Code** to enforce security best practices.

## Conclusion

This project showcases a fully automated cloud-native deployment using **Terraform, Kubernetes, and GitHub Actions** on **GCP**. It follows best practices for **security, networking, and scalability**. 🚀

