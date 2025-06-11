# Path: commands.ps1
# Purpose: Common commands for running Playwright, Pytest, Postman, Azure CLI, and deployment tasks in this demo.

# Install Playwright test dependencies and run UI/API tests
npm install --save-dev @playwright/test
cd playwright-tests
npx playwright test
npx playwright test --grep "@api"
npx playwright test --grep "@utils"

# Run Python API and BDD tests with HTML reporting
cd \api-tests\python
.\.venv\Scripts\activate
pytest --html=../../reports/api/index.html --self-contained-html
pytest tests/test_status_check.py --html=../../reports/bdd/index.html --self-contained-html

# Azure CLI: Show account, set subscription, and set environment variable for Terraform
az account show --query id --output tsv
az account set --subscription "your-subscription-id"
$env:ARM_SUBSCRIPTION_ID="your-subscription-id"
powershell -ExecutionPolicy Bypass -File tests\Test-Terraform.ps1

# Upload HTML reports to Azure Blob Storage
cd .\scripts\
./upload_report.sh

# Check your static site:
# https://qaplaywrightstorage.z8.web.core.windows.net/

# Create a service principal for GitHub Actions CI/CD integration
az ad sp create-for-rbac --name "github-ci-sp" --role="Contributor" --scopes="/subscriptions/<YOUR_SUBSCRIPTION_ID>" --sdk-auth
# Copy the JSON Output and add as GitHub Secret

# Test Postman Collection and generate HTML report
npm install -g newman
npm install -g newman-reporter-html
newman run .\api-tests\postman\postman_collection.json
newman run .\api-tests\postman\postman_collection.json -r html --reporter-html-export ./reports/api/postman-report.html