# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Project Overview

This is a Terraform project for deploying Azure Virtual Network infrastructure for the Facets project. It creates a comprehensive multi-environment network setup with proper segmentation and security controls.

## Architecture Summary

### Infrastructure Pattern
- **Single VNet Design**: All environments share one virtual network (`vnet-facets-core`) with `10.0.0.0/16` address space
- **Multi-Environment Support**: Segregated environments including shared, cfg1-3, dev1, and tst1-6
- **Three-Tier Architecture**: Each environment has dedicated subnets for database (/26), application (/24), and VDI (/22) tiers
- **Application Security Groups**: Centralized security groupings (db, app, vdi, web, mgmt) for network access control

### Resource Organization
- **12 Resource Groups**: Core infrastructure separated by environment and function
- **30 Subnets**: 3 subnets per environment (10 environments) with hierarchical IP allocation
- **5 Application Security Groups**: For implementing network security policies

## Development Commands

### Initial Setup
```bash
# Copy variables template and configure
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with actual Azure credentials

# Initialize Terraform
terraform init
```

### Standard Workflow
```bash
# Validate configuration
terraform validate

# Check formatting
terraform fmt -check -recursive

# Plan deployment
terraform plan -var="subscription_id=$ARM_SUBSCRIPTION_ID" -var="client_id=$ARM_CLIENT_ID" -var="client_secret=$ARM_CLIENT_SECRET" -var="tenant_id=$ARM_TENANT_ID"

# Apply changes
terraform apply -var="subscription_id=$ARM_SUBSCRIPTION_ID" -var="client_id=$ARM_CLIENT_ID" -var="client_secret=$ARM_CLIENT_SECRET" -var="tenant_id=$ARM_TENANT_ID"

# Clean up resources
terraform destroy
```

### Development Utilities
```bash
# Format all Terraform files
terraform fmt -recursive

# Show current state
terraform show

# List resources
terraform state list

# View specific resource
terraform state show azurerm_virtual_network.main
```

## File Structure & Responsibilities

### Core Infrastructure Files
- **`main.tf`**: Provider configuration and resource group definitions for all 12 environments
- **`network.tf`**: VNet definition and all 30 subnet configurations with CIDR allocation
- **`security_groups.tf`**: Application security groups for network access control
- **`variables.tf`**: Input variables including sensitive Azure credentials and configuration options
- **`outputs.tf`**: Structured outputs for resource names, IDs, and network information

### Configuration Files
- **`terraform.tfvars.example`**: Template for local configuration (copy to `terraform.tfvars`)
- **`.gitignore`**: Comprehensive exclusions for Terraform state, credentials, and IDE files

### CI/CD Integration
- **`.github/workflows/terraform.yml`**: GitHub Actions workflow with plan/apply automation, manual destroy option, and production environment protection

## Azure Authentication

The project uses Azure Service Principal authentication with four required credentials:
- `ARM_CLIENT_ID`: Service Principal Client ID
- `ARM_CLIENT_SECRET`: Service Principal Client Secret  
- `ARM_SUBSCRIPTION_ID`: Azure Subscription ID
- `ARM_TENANT_ID`: Azure Tenant ID

These must be configured either in `terraform.tfvars` (local) or as GitHub repository secrets (CI/CD).

## Environment Patterns

### Subnet Naming Convention
Format: `snet-{tier}-{environment}`
- **Database tier**: /26 networks (64 IPs)
- **Application tier**: /24 networks (256 IPs) 
- **VDI tier**: /22 networks (1024 IPs)

### IP Address Allocation Strategy
The `/16` address space is systematically divided:
- Shared environments start at `10.0.0.0`
- Configuration environments use middle ranges
- Test environments allocated in higher octets
- VDI subnets use larger blocks due to /22 requirements

## GitHub Actions Workflow

### Automatic Triggers
- **Pull Requests**: Runs validation, format check, and plan
- **Push to main**: Executes full apply after successful plan
- **Manual Dispatch**: Supports plan, apply, or destroy operations

### Security Features  
- Production environment protection
- Credential validation before execution
- Detailed plan output generation
- Azure authentication verification

## Key Terraform Patterns Used

### Resource Dependencies
- All subnets depend on the main VNet resource
- Resource groups are referenced by network resources
- Application security groups are independent for flexible assignment

### Variable Management
- Sensitive variables properly marked and excluded from version control
- Default values provided for location and common tags
- Environment-specific overrides supported through tfvars

### State Management
- Local state files excluded from version control
- Resource naming follows Azure conventions
- Outputs structured for consumption by other Terraform configurations
