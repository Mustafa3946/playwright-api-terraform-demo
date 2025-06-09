Write-Host "Running Terraform validation..." -ForegroundColor Cyan

# Move to the infra directory
Push-Location ../playwright-api-terraform-demo/infra/

# Initialize Terraform without backend
terraform init -backend=false | Out-Null

# Validate Terraform syntax
terraform validate
if ($LASTEXITCODE -eq 0) {
    Write-Host "Terraform files are valid." -ForegroundColor Green
} else {
    Write-Host "Terraform validation failed." -ForegroundColor Red
    Exit 1
}

Pop-Location
