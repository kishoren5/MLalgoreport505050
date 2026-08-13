# Next Word Predictor - DevOps & Deployment Instructions

This repository contains configurations to deploy the Next Word Predictor Flask application. You can deploy it using Docker, Kubernetes, Terraform, or Ansible.

---

## 1. Docker (Local Setup & Run)

A Docker image can be built and run locally to test the containerized version of the application.

### Build the Image
```bash
docker build -t next-word-predictor:latest .
```

### Run the Container
Run the container, mapping host port `5000` to container port `5000`:
```bash
docker run -d -p 5000:5000 --name next-word-predictor next-word-predictor:latest
```
Access the application locally at `http://localhost:5000`.

---

## 2. Terraform (AWS EKS & ECR Infrastructure Setup)

The Terraform scripts provision a Virtual Private Cloud (VPC), an Elastic Container Registry (ECR), and an Elastic Kubernetes Service (EKS) cluster on AWS.

### Prerequisites
1. Install [Terraform CLI](https://developer.hashicorp.com/terraform/downloads).
2. Install [AWS CLI](https://aws.amazon.com/cli/) and configure credentials (`aws configure`).

### Setup & Deployment
Navigate to the `terraform/` directory and run:

```bash
cd terraform
# Initialize Terraform
terraform init

# Plan resources to verify
terraform plan

# Apply and provision infrastructure (this can take 10-15 minutes for EKS)
terraform apply -auto-approve
```

---

## 3. Kubernetes (Orchestration & Deployments)

Once your infrastructure is ready (via Terraform or a local cluster like Minikube/Docker Desktop), you can deploy the app using the manifests in the `kubernetes/` folder.

### Prerequisites
1. Setup your `kubectl` context to point to your Kubernetes cluster.
2. Push your Docker image to a registry (e.g. AWS ECR or Docker Hub) and update the `image` field in `kubernetes/deployment.yaml`.

### Deploy manifest files
```bash
# Apply deployment (deploys pods)
kubectl apply -f kubernetes/deployment.yaml

# Apply service (exposes load balancer)
kubectl apply -f kubernetes/service.yaml

# Apply ingress (optional routing setup)
kubectl apply -f kubernetes/ingress.yaml
```

### Verify Status
```bash
# Check running pods
kubectl get pods

# Check service IP address
kubectl get service next-word-predictor-service
```

---

## 4. Ansible (VM Configuration & Container Deployment)

Use Ansible to automate installing Docker on standard Linux VMs (Ubuntu/Debian) and running the application container.

### Prerequisites
1. Install Ansible (`pip install ansible`).
2. Update the target IPs and SSH keys in `ansible/inventory.ini`.

### Run Playbook
Navigate to the `ansible/` directory and run:

```bash
cd ansible
ansible-playbook -i inventory.ini playbook.yml
```
This will automatically connect to target hosts, install Docker, pull the image, and start the app container bound to port `80`.
