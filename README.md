
# A simple Python application deployed to GKE



## Project Requirements

Terraform

GCP Account

Kubernetes

Kubectl




## Deliverables

- Deployed using an Infrastructure as Code approach(Terraform).
- Application deployment should be clear, readable and maintainable.
- You can use an IaaS provider of your choice(I will be using GCP).
- The application should run on Kubernetes


## Provison Infrastructure

With Terraform, we will provision the necessary infrastructure resources on Azure[resource group, vn, subnets and eks].

* Confirm you have gcp cli and Terraform installed with the commands:
```bash
  gcloud --version

  terrform --version

  gcloud init --console-only --account [your gcp account details] --project[gcp project in your account]

```

* Git clone this repository and navigate to the infrastructure folder.
```bash
    https://github.com/victor-ok/sock-shop-deployment.git

    cd infrastructure
```

* Run the following commands to initialize, plan and apply the main.tf
```bash
    terraform init

    terraform plan
    
    terraform apply
```

* Your resources should be running after a short while.