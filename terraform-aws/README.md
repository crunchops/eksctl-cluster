# AWS Infrastructure Terraform Deployment

This README provides instructions for deploying VPC, VPC Endpoints, and VPN Server using Terraform.

## VPC Deployment

### Prerequisites
- Terraform installed on your local machine
- AWS CLI configured with appropriate credentials
- Variables file located at `../../vars/vpc.tfvars`

### Deployment Steps

1. **Navigate to the VPC directory**
```bash
cd terraform-aws/infra/vpc
```

2. **Initialize Terraform**
```bash
terraform init
```
This command initializes the working directory and downloads the necessary provider plugins.

3. **Preview the VPC deployment**
```bash
terraform plan --var-file=../../vars/vpc.tfvars
```
This generates an execution plan showing what Terraform will do.

4. **Deploy the VPC**
```bash
terraform apply --var-file=../../vars/vpc.tfvars --auto-approve
```
This applies the changes to create the VPC, with auto-approve skipping the manual confirmation step.

5. **Cleanup VPC**
```bash
terraform destroy --var-file=../../vars/vpc.tfvars --auto-approve
```
This destroys all VPC resources created by the Terraform configuration.

## VPC Endpoints Deployment

### Prerequisites
- Terraform installed on your local machine
- AWS CLI configured with appropriate credentials
- Variables file located at `../../vars/vpc-endpoints.tfvars`
- Existing VPC deployment (from steps above)

### Deployment Steps

1. **Navigate to the VPC Endpoints directory**
```bash
cd terraform-aws/infra/vpc-endpoints
```

2. **Initialize Terraform**
```bash
terraform init
```
This command initializes the working directory and downloads the necessary provider plugins.

3. **Preview the endpoints deployment**
```bash
terraform plan --var-file=../../vars/vpc-endpoints.tfvars
```
This generates an execution plan showing what Terraform will do.

4. **Deploy the endpoints**
```bash
terraform apply --var-file=../../vars/vpc-endpoints.tfvars --auto-approve
```
This applies the changes to create the VPC endpoints, with auto-approve skipping the manual confirmation step.

5. **Cleanup endpoints**
```bash
terraform destroy --var-file=../../vars/vpc-endpoints.tfvars --auto-approve
```
This destroys all endpoint resources created by the Terraform configuration.

## VPN Server Deployment

### Prerequisites
- Terraform installed on your local machine
- AWS CLI configured with appropriate credentials
- Variables file located at `../../vars/vpn-server.tfvars`
- Existing VPC deployment (from steps above)

### Deployment Steps

1. **Navigate to the VPN Server directory**
```bash
cd terraform-aws/infra/vpn-server
```

2. **Initialize Terraform**
```bash
terraform init
```
This command initializes the working directory and downloads the necessary provider plugins.

3. **Preview the VPN server deployment**
```bash
terraform plan --var-file=../../vars/vpn-server.tfvars
```
This generates an execution plan showing what Terraform will do.

4. **Deploy the VPN server**
```bash
terraform apply --var-file=../../vars/vpn-server.tfvars --auto-approve
```
This applies the changes to create the VPN server, with auto-approve skipping the manual confirmation step.

5. **Cleanup VPN server**
```bash
terraform destroy --var-file=../../vars/vpn-server.tfvars --auto-approve
```
This destroys all VPN server resources created by the Terraform configuration.

## Notes
- Ensure all `.tfvars` files contain the correct variables for your environment
- VPC must be deployed before VPC endpoints and VPN server
- Review the plan output before applying in a production environment
- Consider removing `--auto-approve` for manual verification in sensitive deployments