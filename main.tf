provider "aws" {
    region = "us-east-1"
}

terraform {
    backend "s3" {
        bucket = "harkom-terraform-state"
        key    = "terraform.tfstate"
        region = "us-east-1"
        dynamodb_table = "harkom-terraform-state-lock"
    }
}

resource "aws_organizations_organization" "harkom" {
    aws_service_access_principals = ["config-multiaccountsetup.amazonaws.com"]
    feature_set                   = "ALL"
}