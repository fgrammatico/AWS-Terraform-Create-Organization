# Terraform AWS Organization Configuration

This repository contains a Terraform configuration for setting up an AWS Organization.

## Requirements

- Terraform 0.14 or newer
- AWS account

## Provider Configuration

The AWS provider is configured to use the `us-east-1` region.

```hcl
provider "aws" {
    region = "us-east-1"
}

Sure, here's a basic `README.md` for your Terraform configuration:

```markdown
# Terraform AWS Organization Configuration

This repository contains a Terraform configuration for setting up an AWS Organization.

## Requirements

- Terraform 0.14 or newer
- AWS account

## Provider Configuration

The AWS provider is configured to use the `us-east-1` region.

```hcl
provider "aws" {
    region = "us-east-1"
}
```

## Backend Configuration

The Terraform state is stored in an S3 bucket, and state locking is handled by a DynamoDB table.

```hcl
terraform {
    backend "s3" {
        bucket = "harkom-terraform-state"
        key    = "terraform.tfstate"
        region = "us-east-1"
        dynamodb_table = "harkom-terraform-state-lock"
    }
}
```

## AWS Organization Configuration

An AWS Organization is created with the `ALL` feature set and the `config-multiaccountsetup.amazonaws.com` service access principal.

```hcl
resource "aws_organizations_organization" "harkom" {
    aws_service_access_principals = ["config-multiaccountsetup.amazonaws.com"]
    feature_set                   = "ALL"
}
```

## Usage

Initialize the Terraform backend:

```bash
terraform init
```

Plan the changes:

```bash
terraform plan
```

Apply the changes:

```bash
terraform apply
```
```

This `README.md` provides a brief overview of your Terraform configuration, the requirements for using it, and instructions on how to apply it. You can customize it to better fit your project.