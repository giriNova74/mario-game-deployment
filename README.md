# 🎮 Super Mario Game Deployment Using Kubernetes & Terraform on AWS

## Relive the Magic of 90s Gaming – Now on the Cloud!

Hey retro gamers and tech enthusiasts! Remember the excitement of 90s video games? Let’s take a trip down memory lane and revisit those iconic moments. In this repository, we’re bringing the beloved **Super Mario** to life in a whole new way – powered by the **cloud** and deployed using **Kubernetes**!

With **Amazon Elastic Kubernetes Service (EKS)** as the platform and **Terraform** for infrastructure automation, this project combines nostalgia with modern cloud-native tools for scalability, reliability, and fun!

---

## 🔧 Prerequisites

Before getting started, make sure you have the following ready:

- An Ubuntu-based EC2 instance
- A properly configured IAM role with required permissions
- Terraform installed on the instance
- AWS CLI and kubectl installed for managing AWS and Kubernetes

---

## 🚀 Let's Deploy

### Launch an Ubuntu EC2 Instance

Log in to AWS Console and go to EC2 under Services. Click "Launch Instance", choose an Ubuntu AMI, and select the `t2.micro` instance type. Configure the instance (number = 1), attach IAM role, and set storage to 8GB. Optionally add tags. In the security group, ensure necessary ports like SSH (22) are open. Click “Launch” and choose an existing key pair. Once launched, connect via SSH using the instance’s public IP or DNS.

---

### Create and Attach IAM Role

Search for IAM in the AWS Console, go to **Roles**, and click **Create Role**.  
- Select: AWS service → EC2  
- Permissions: Attach `AdministratorAccess` (for demo purposes)  
- Name the role and create it.

Go to EC2 → Select your instance → Actions → Security → Modify IAM Role → Attach the new role.

---

### Cluster Provisioning

```bash
git clone https://github.com/giriNova74/mario-game-deployment.git
cd mario-game-deployment
```
give permissions to execute script file

```bash
sudo chmod +x install_script.sh
./install_script.sh
```
This script installs:

Terraform

AWS CLI

kubectl

Docker

Verify installations:

```bash
docker --version
aws --version
kubectl version --client
terraform --version
```

Navigate to the Terraform folder:

```bash
cd game_tf
```

Update the backend.tf file with your custom S3 bucket name.

Initialize and apply Terraform:

```bash
terraform init
terraform validate
terraform plan
terraform apply --auto-approve
```
Note: If you encounter permission issues, create a custom policy that allows EKS access.

Update kubeconfig and Deploy Mario

```bash
aws eks update-kubeconfig --name EKS_CLOUD --region ap-south-1
```

Return to the main directory:

```bash
cd ..
```

Apply deployment and service:

```bash
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl get all
```

Get the LoadBalancer URL:

```bash
kubectl describe service mario-service
```

Copy the LoadBalancer Ingress URL and open it in your browser — enjoy the Mario game!

🐳 Docker Image
This deployment uses the Docker image:

sevenajay/mario:latest

🧨 Tear Down Resources
Delete Kubernetes resources:

```bash
kubectl delete service mario-service
kubectl delete deployment mario-deployment
```

Destroy infrastructure:

```bash
cd game_tf
terraform destroy --auto-approve
```
All resources will be deleted within a few minutes.

📖 Reference
Tutorial credit: Mr Cloud Book

🎉 The End
Let’s go back to 1985 and enjoy the nostalgia – now running in the cloud!



---
