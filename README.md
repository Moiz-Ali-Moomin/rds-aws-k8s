# ☁️ Hybrid Infrastructure using Terraform (Kubernetes + AWS RDS)

## 📌 Overview
This project demonstrates how to use **Terraform to manage a hybrid infrastructure**, combining:

- **Kubernetes resources** (WordPress application running on Minikube)
- **AWS managed services** (MySQL database using Amazon RDS)

It showcases how Terraform can orchestrate **multiple providers together** to deploy application and database layers across different platforms.

---

## 🧠 Problem Statement
In real-world systems:
- Applications may run on Kubernetes (on-prem or local clusters)
- Databases are often hosted as managed cloud services (RDS)

Managing these components separately leads to:
- Configuration drift
- Manual dependency handling
- Poor reproducibility

This project solves the problem by using **Terraform as a single control plane** to manage both Kubernetes and AWS resources.

---

## 🏗️ Architecture & Workflow
User
↓
Terraform
↓
Kubernetes (Minikube) AWS
↓ ↓
WordPress Deployment MySQL RDS
↓
NodePort Service

yaml
Copy code

---

## 🛠️ Tech Stack
- **Infrastructure as Code:** Terraform
- **Container Orchestration:** Kubernetes (Minikube)
- **Cloud Provider:** AWS
- **Database:** Amazon RDS (MySQL)
- **Application:** WordPress

---

## ⚙️ Key Features
- Kubernetes Deployment for WordPress
- Kubernetes Service (NodePort) for application access
- AWS RDS MySQL instance provisioning
- Multi-provider Terraform configuration
- Clean separation of application (`k8s.tf`) and cloud (`aws.tf`) resources

---

## 📂 Project Structure

```text
terraform-hybrid-k8s-aws/
├── aws.tf        # AWS provider + RDS MySQL instance
├── k8s.tf        # Kubernetes provider + WordPress deployment/service
└── README.md

🚀 How to Run the Project

1️⃣ Prerequisites
Terraform installed

Minikube installed and running

kubectl configured

AWS CLI configured with credentials

AWS account with RDS permissions

2️⃣ Start Minikube
bash
Copy code
minikube start
Verify cluster:

bash
Copy code
kubectl get nodes

3️⃣ Initialize Terraform
bash
Copy code
terraform init

4️⃣ Review the execution plan
bash
Copy code
terraform plan

5️⃣ Apply the infrastructure
bash
Copy code
terraform apply

📊 Verification
Kubernetes
bash
Copy code
kubectl get deployments
kubectl get pods
kubectl get svc
Access WordPress:

bash
Copy code
minikube service wordpress-service
AWS RDS
Terraform output will display the RDS endpoint:

bash
Copy code
terraform output

📌 Outputs

RDS Endpoint – MySQL database hostname for WordPress

🧪 What I Learned

Managing multiple Terraform providers in a single project

Deploying Kubernetes workloads using Terraform

Provisioning managed databases with AWS RDS

Separating application and infrastructure layers

Building hybrid cloud architectures

🔮 Future Enhancements

Connect WordPress to RDS using Kubernetes Secrets

Replace NodePort with Ingress

Use Terraform variables for credentials

Secure RDS with private subnets

Deploy Kubernetes on EKS instead of Minikube

Add CI/CD for Terraform workflows

yaml
Copy code
