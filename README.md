# Secure GCP Infrastructure with Terraform

## Overview

This project demonstrates Infrastructure as Code (IaC) on Google Cloud Platform using Terraform. It provisions a custom VPC, subnet, firewall configuration, and a private Cloud Storage bucket.

## Objectives

- Automate infrastructure provisioning using Terraform.
- Maintain version-controlled infrastructure code in GitHub.
- Apply network security and storage access controls.
- Use Google Cloud IAM and Application Default Credentials securely.
- Demonstrate infrastructure validation, planning, deployment, and cleanup.

## Architecture

- Google Cloud Platform
- Terraform
- Custom VPC and subnet
- Restrictive ingress firewall configuration
- Private Cloud Storage bucket
- Git and GitHub

## Security Controls

- Public access prevention for Cloud Storage.
- Uniform bucket-level access.
- Google-managed encryption at rest.
- Internal-only ingress firewall rule.
- Credentials excluded from version control.
- IAM least-privilege review.

## Deployment

1. Install Terraform and Google Cloud CLI.
2. Authenticate using Application Default Credentials.
3. Enable the required Google Cloud APIs.
4. Configure `terraform.tfvars` locally.
5. Run `terraform init`.
6. Run `terraform fmt -recursive` and `terraform validate`.
7. Review `terraform plan`.
8. Deploy with `terraform apply`.

## Validation

The infrastructure can be reviewed using the Terraform plan and output commands and by inspecting the corresponding resources in the Google Cloud Console.

## Cost Management

This project is designed as a small learning lab. Cloud resource usage, billing requirements, storage operations, and applicable Free Tier limits must be reviewed before deployment.

## Future Improvements

- Add a dedicated Terraform service account with least-privilege permissions.
- Configure remote Terraform state in a secured Cloud Storage bucket.
- Add automated Terraform formatting and validation with GitHub Actions.
- Add a Compute Engine VM with a restricted access model.
- Add infrastructure security scanning.
