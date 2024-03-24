# This is a simple example of how to manage Kubernetes using Terraform.

## Preparation:
1. Install Minikube (https://kubernetes.io/en/docs/tasks/tools/install-minikube/)
2. The example uses VirtualBox as the driver.

## Clone the repo and run these commands:

* Initialize a new or existing Terraform working directory by creating
  initial files, loading any remote state, downloading modules, etc.
```bash
terraform init
```
* Generates a speculative execution plan
```bash
terraform plan
```
* Creates or updates infrastructure according to Terraform configuration
  files in the current directory.
```bash
terraform apply
```
* check namespace
```
kubectl get ns
kubectl describe ns application
```
* Clean up. Destroy Terraform-managed infrastructure.
```bash
terraform destroy
```

* Example running with variable values in the command line interface 
```bash
terraform apply -var 'namespace=production' -var 'pod-cpu=400m' -var 'pod-memory=2048Mi' -var 'container-cpu=30M' -var 'container-mem=48Mi'
```