 npx playwright test playwright-tests/utils/helpers.spec.ts
 npx playwright test
 npx playwright test --grep "@api"
 npx playwright test --grep "@utils"
 
 # go to playwright-api-terraform-demo\api-tests\python
 .\.venv\Scripts\activate
 pytest --html=../../reports/index.html --self-contained-html

az account show --query id --output tsv
az account set --subscription "your-subscription-id"
$env:ARM_SUBSCRIPTION_ID="your-subscription-id"
powershell -ExecutionPolicy Bypass -File tests\Test-Terraform.ps1
# bash script to upload the html
cd .\scripts\
./upload_report.sh

# Check your static site:
https://qaplaywrightstorage.z8.web.core.windows.net/

# Step 1: create a service principal with sufficient permissions (Contributor is usually enough for Terraform):
az ad sp create-for-rbac --name "github-ci-sp" --role="Contributor" --scopes="/subscriptions/<YOUR_SUBSCRIPTION_ID>" --sdk-auth
# Step 2: Copy the JSON Output
# Step 3: Add as GitHub Secret