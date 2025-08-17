# Azure VNet Option 3 - Facets Infrastructure

This Terraform configuration creates a comprehensive Azure virtual network infrastructure for the Facets project.

## Architecture Overview

This configuration creates:

### Resource Groups
- `rg-facets-core` - Core infrastructure resources
- `rg-facets-mgmt` - Management resources
- `rg-facets-shared` - Shared resources
- `rg-cfg1`, `rg-cfg2`, `rg-cfg3` - Configuration environments
- `rg-dev1` - Development environment
- `rg-tst1` through `rg-tst6` - Test environments

### Virtual Network
- **Name**: `vnet-facets-core`
- **Address Space**: `10.0.0.0/16`
- **Location**: East US (configurable)

### Subnets
For each environment, three subnets are created:
- **Database subnets**: `/26` CIDR (64 IP addresses)
- **Application subnets**: `/24` CIDR (256 IP addresses) 
- **VDI subnets**: `/22` CIDR (1024 IP addresses)

### Application Security Groups
- `asg-db` - Database tier security group
- `asg-app` - Application tier security group
- `asg-vdi` - VDI tier security group
- `asg-web` - Web tier security group
- `asg-mgmt` - Management tier security group

## Prerequisites

1. **Azure CLI** installed and authenticated
2. **Terraform** v1.0 or later installed
3. **Service Principal** with appropriate permissions
4. **Git** for version control

## Setup Instructions

### 1. Configure Azure Service Principal

Create a service principal for Terraform:

```bash
# Login to Azure
az login

# Create service principal
az ad sp create-for-rbac --name "terraform-sp-facets" --role="Contributor" --scopes="/subscriptions/YOUR_SUBSCRIPTION_ID"
```

### 2. Configure Terraform Variables

1. Copy the example variables file:
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```

2. Edit `terraform.tfvars` with your actual values:
   ```hcl
   subscription_id = "your-subscription-id"
   client_id       = "your-service-principal-client-id"
   client_secret   = "your-service-principal-client-secret"
   tenant_id       = "your-tenant-id"
   location        = "East US"
   ```

### 3. Deploy Infrastructure

```bash
# Initialize Terraform
terraform init

# Plan the deployment
terraform plan

# Apply the configuration
terraform apply
```

### 4. Clean Up (when needed)

```bash
terraform destroy
```

## File Structure

```
azure-vnet-option3/
├── main.tf                    # Main Terraform configuration
├── network.tf                 # VNet and subnet configurations
├── security_groups.tf         # Application security groups
├── variables.tf               # Input variables
├── outputs.tf                 # Output values
├── terraform.tfvars.example   # Example variables file
├── .gitignore                 # Git ignore rules
└── README.md                  # This file
```

## Security Considerations

- The `terraform.tfvars` file contains sensitive information and is excluded from version control
- Service principal credentials should be stored securely
- Consider using Azure Key Vault for sensitive values in production
- Review and customize the security groups based on your security requirements

## Customization

You can customize the deployment by modifying:

- **Location**: Change the `location` variable in `terraform.tfvars`
- **Tags**: Update the `common_tags` variable in `variables.tf`
- **Address Space**: Modify the VNet address space in `network.tf`
- **Subnet Sizes**: Adjust subnet CIDR blocks as needed

## Outputs

After successful deployment, Terraform will output:

- Resource group names
- Virtual network details
- Subnet information
- Application security group names

## Support

For issues or questions, please create an issue in this repository or contact the Infrastructure Team.
