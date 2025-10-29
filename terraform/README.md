# Terraform AWS Setup

This folder contains Terraform code to create an EC2 instance on AWS.

## Usage

1. Initialize Terraform:
```bash
terraform init
```
2. Validate:
```bash
terraform validate
```
3. Plan:
```bash
terraform plan
```
4. Apply:
```bash
terraform apply -auto-approve
```
5. Destroy (when done):
```bash
terraform destroy -auto-approve
```

## Notes
- Make sure your SSH key exists locally (`~/.ssh/docker_key.pub`)
- Instance comes with Docker installation (via user_data)
