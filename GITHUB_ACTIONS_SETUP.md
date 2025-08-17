# GitHub Actions Setup Guide

This guide will help you configure GitHub Actions to run Terraform deployments with Azure authentication.

## Prerequisites

1. Azure Service Principal (already created)
2. GitHub repository with admin access

## Step 1: Configure GitHub Secrets

You need to add the following secrets to your GitHub repository:

### Navigate to GitHub Repository Settings
1. Go to your GitHub repository: `https://github.com/humblejay/azure-vnet-option3`
2. Click **Settings** tab
3. In the left sidebar, click **Secrets and variables** > **Actions**
4. Click **New repository secret**

### Add These Secrets

| Secret Name | Value | Description |
|------------|-------|-------------|
| `ARM_CLIENT_ID` | `your-service-principal-client-id` | Service Principal Client ID |
| `ARM_CLIENT_SECRET` | `your-service-principal-client-secret` | Service Principal Client Secret |
| `ARM_SUBSCRIPTION_ID` | `your-azure-subscription-id` | Azure Subscription ID |
| `ARM_TENANT_ID` | `your-azure-tenant-id` | Azure Tenant ID |

> **Note**: Replace the placeholder values above with your actual Azure service principal credentials.

### How to Add Each Secret
1. Click **New repository secret**
2. Enter the **Name** (e.g., `ARM_CLIENT_ID`)
3. Enter the **Secret** value
4. Click **Add secret**
5. Repeat for all four secrets

## Step 2: Set Up GitHub Environment (Optional but Recommended)

For additional security, you can create a production environment:

1. In repository **Settings**, go to **Environments**
2. Click **New environment**
3. Name it `production`
4. Configure protection rules (optional):
   - Required reviewers
   - Wait timer
   - Deployment branches

## Step 3: Verify Workflow Configuration

The workflow file `.github/workflows/terraform.yml` is already configured to:

- ✅ Trigger on push to `main` branch and pull requests
- ✅ Use Ubuntu latest runner
- ✅ Install Terraform
- ✅ Run `terraform init`, `validate`, and `plan` on all changes
- ✅ Run `terraform apply` only on push to `main` branch

## Step 4: Test the Pipeline

1. Commit and push changes to a feature branch
2. Create a pull request to `main`
3. Verify that the pipeline runs successfully
4. Merge the pull request to trigger deployment

## Common Issues and Solutions

### Issue 1: Authentication Errors
```
Error: building AzureRM Client: obtain subscription() from Azure CLI: parsing json result from the Azure CLI
```
**Solution**: Ensure all four ARM_* secrets are correctly set in GitHub repository secrets.

### Issue 2: Resource Already Exists
```
Error: A resource with the ID "/subscriptions/.../resourceGroups/rg-xxx" already exists
```
**Solution**: This happens when resources exist outside Terraform state. You can:
- Import existing resources: `terraform import azurerm_resource_group.name /subscriptions/.../resourceGroups/rg-name`
- Or delete existing resources if they're not needed

### Issue 3: Permission Errors
```
Error: insufficient privileges to complete the operation
```
**Solution**: Ensure the service principal has Contributor role on the subscription.

### Issue 4: Terraform State Lock
```
Error: Error acquiring the state lock
```
**Solution**: This happens with concurrent runs. Wait for other operations to complete or manually unlock if needed.

## Workflow Features

- **Automatic Planning**: Every pull request will run `terraform plan`
- **Automatic Deployment**: Pushes to `main` branch will run `terraform apply`
- **Security**: Sensitive values are stored as GitHub secrets
- **Validation**: Code is validated before deployment
- **Environment Protection**: Uses production environment for additional security

## Next Steps

1. Configure the GitHub secrets as described above
2. Push this updated code to trigger the workflow
3. Monitor the Actions tab for deployment status
4. Check Azure portal to verify resources are created

## Troubleshooting

If you encounter issues:

1. Check the **Actions** tab in your GitHub repository
2. Review the workflow logs for specific error messages
3. Verify all secrets are correctly configured
4. Ensure the service principal has appropriate permissions
5. Check Azure portal for any resource conflicts
