# playwright-api-terraform-demo

## Overview

This project is a **cloud-native, end-to-end test automation framework** that demonstrates full-stack quality engineering capabilities, covering:

- **UI Automation (Playwright)**
- **API Testing (Pytest + Requests)**
- **BDD Testing (pytest-bdd)**
- **Postman Collections (Newman HTML Reports)**
- **Infrastructure as Code (Terraform on Azure)**
- **CI/CD Automation (GitHub Actions)**
- **Test Reporting via Azure Blob Static Website Hosting**

It reflects a real-world enterprise scenario—integrating automated test coverage into a CI/CD pipeline, targeting UI, API, and integration layers while publishing reports accessible to stakeholders.

**Live Demo:**  
View the latest published test reports at:  
[https://qaplaywrightstorage.z8.web.core.windows.net/](https://qaplaywrightstorage.z8.web.core.windows.net/)

---

## Tech Stack Coverage in This Demo

This repository **directly implements** the core automation engineering skills and technologies highlighted in the job description:

| Capability                                    | Implementation in This Demo                                |
|-----------------------------------------------|------------------------------------------------------------|
| **UI Automation (Cross-browser)**             | Playwright (Node.js / TypeScript)                          |
| **API Testing (Functional)**                  | Python `pytest` + `requests`                               |
| **BDD Testing (Readable Scenarios)**          | Python `pytest-bdd` + Gherkin                              |
| **API Contract Testing**                      | Postman + Newman (HTML Reports)                            |
| **Integration Testing**                       | Coordinated test execution across layers                   |
| **Infrastructure as Code (IaC)**              | Terraform on Azure                                         |
| **CI/CD Pipeline**                            | GitHub Actions                                             |
| **Cloud Deployment**                          | Microsoft Azure (Free Tier)                                |
| **Test Reporting**                            | HTML reports hosted via Azure Blob static website          |

> **This demo covers the full spectrum of automation engineering: scalable frameworks, cross-layer test coverage, CI/CD integration, cloud provisioning, and stakeholder reporting.**

---

## Architecture Diagram

```text
+----------------------+
|   GitHub Repository  |
+----------------------+
           |
           |  (Push/PR triggers CI/CD)
           v
+----------------------+
|   GitHub Actions     |
|----------------------|
| - Terraform apply    |
| - Run tests          |
| - Upload reports     |
+----------------------+
           |
           v
+---------------------------------------------------------------+
|                        Azure Cloud                            |
|                                                               |
|  +------------------+   +--------------------------+   +------------------------------+   +------------------+     |
|  | Playwright Tests |   | Python API Tests         |   | BDD Tests                    |   | Postman Tests    |     |
|  | (UI Functional)  |   | (pytest + requests)      |   | (pytest-bdd + requests)      |   | (Newman)         |     |
|  +------------------+   +--------------------------+   +------------------------------+   +------------------+     |
|           |                      |                              |                                |                 |
|           +----------+-----------+--------------+---------------+                                |                 |
|                      |                          |                                                |                 |
|                      v                          v                                                v                 |
|              +--------------------------+   +------------------------------+         +--------------------------+  |
|              |   HTML Test Reports      |   |   HTML Test Reports          |         |  HTML Report Public Link |  |
|              |   (UI, API, BDD,         |   |   (Scenario-based, Postman)  |         |  (Accessible to users)   |  |
|              |   Postman)               |   |                              |         |                          |  |
|              +--------------------------+   +------------------------------+         +--------------------------+  |
|                                                               |
|                                                               v
|                                                    +--------------------------+
|                                                    | Azure Storage            |
|                                                    | Static Website           |
|                                                    +--------------------------+
+---------------------------------------------------------------+
```

---

## Folder Structure

```
playwright-api-terraform-demo/
├── .github/
│   └── workflows/
│       └── ci.yml                       # GitHub Actions workflow
├── infra/
│   ├── main.tf                          # Terraform: resource group, storage account, etc.
│   └── variables.tf                     # Terraform variables
├── playwright-tests/
│   ├── api/
│   │   ├── apiClient.ts                 # API client utility for Playwright tests
│   │   └── apiClient.test.ts            # Tests for API client
│   ├── utils/
│   │   ├── helpers.ts                   # Utility/helper functions for tests
│   │   └── helpers.spec.ts              # Tests for helper functions
│   ├── package-lock.json
│   ├── package.json
│   └── playwright.config.ts             # Playwright config file
├── api-tests/
│   └── python/
│   │   ├── tests/
│   │   │   ├── test_api.py              # Sample Python API test
│   │   │   └── test_status_check.py     # Sample BDD test (pytest-bdd)
│   │   ├── requirements.txt             # Python dependencies
│   │   └── features/
│   │       └── status_check.feature     # BDD feature file
│   └── postman/
│       └── postman_collection.json      # Postman collection file
├── reports/
│   ├── api/
│   │   ├── index.html                   # API test report
│   │   └── postman-report.html          # Postman collection HTML report
│   ├── ui/
│   │   └── index.html                   # UI test report
│   ├── bdd/
│   │   └── index.html                   # BDD test report
│   └── index.html                       # Landing page for reports (static site)
├── scripts/
│   └── upload_report.sh                 # Script to upload reports to Azure Blob Storage
└── README.md
```

---

## Features

- **Automated UI Testing:** Fast, reliable cross-browser functional tests with Playwright.
- **Automated API Testing:** REST API validation using Python (pytest + requests).
- **Automated BDD Testing:** Behavior-driven development (BDD) tests using Python (`pytest-bdd` + `requests`) for readable, scenario-based API validation.
- **Postman Collection Testing:** API contract and workflow validation using Postman collections, executed and reported via Newman with HTML output.
- **Infrastructure Provisioning:** Terraform for Azure resources, including Storage Account for hosting reports.
- **CI/CD Pipeline:** GitHub Actions automates Terraform deployment, test execution, and report publishing.
- **Test Reporting:** HTML reports published to Azure Blob static website, accessible to stakeholders.
- **Cost-Effective:** Uses Azure free tier and open-source tools to minimize costs.

---

## Getting Started

### Prerequisites

- Azure account (free tier is sufficient)
- Terraform installed locally
- Node.js installed (for Playwright)
- Python 3.x with pip
- GitHub account for repository and Actions

#### Azure Service Principal for CI/CD

1. Create a service principal with sufficient permissions:
    ```powershell
    az ad sp create-for-rbac --name "github-ci-sp" --role="Contributor" --scopes="/subscriptions/<YOUR_SUBSCRIPTION_ID>" --sdk-auth
    ```
2. Copy the JSON output from the above command.
3. Add this JSON as a GitHub Secret (e.g., `AZURE_CREDENTIALS`) in your repository settings.

---

### Setup Instructions

1. **Clone the repository:**
    ```bash
    git clone https://github.com/Mustafa3946/playwright-api-terraform-demo.git
    cd playwright-api-terraform-demo
    ```

2. **Configure Terraform variables** in `infra/variables.tf` or via environment variables.

3. **Deploy Azure infrastructure:**
    ```bash
    cd infra
    terraform init
    terraform apply
    ```

4. **Run Playwright UI tests:**
    ```bash
    cd ../playwright-tests
    npm install
    npx playwright test
    npx playwright test --grep "@api"
    npx playwright test --grep "@utils"
    ```

5. **Run API, BDD, and Postman tests:**
    ```powershell
    cd ../api-tests/python
    python -m venv .venv
    .\.venv\Scripts\activate
    pip install -r requirements.txt
    # Run all API tests and generate report
    pytest --html=../../reports/index.html --self-contained-html
    # Run BDD scenario tests and generate BDD report
    pytest tests/test_status_check.py --html=../../reports/bdd/index.html --self-contained-html
    ```

6. **Test Postman Collection:**
    ```bash
    npm install -g newman
    npm install -g newman-reporter-html
    newman run ./api-tests/postman/postman_collection.json
    newman run ./api-tests/postman/postman_collection.json -r html --reporter-html-export ./reports/api/postman-report.html
    ```

7. **Azure CLI & Terraform test (optional):**
    ```powershell
    az account set --subscription "your-subscription-id"
    $env:ARM_SUBSCRIPTION_ID="your-subscription-id"
    powershell -ExecutionPolicy Bypass -File tests\Test-Terraform.ps1
    ```

8. **Upload test reports to Azure Blob Storage:**
    ```bash
    cd ../../scripts
    ./upload_report.sh
    ```

9. **Check your static site:**
    ```
    https://qaplaywrightstorage.z8.web.core.windows.net/
    ```

---

## CI/CD Integration

- The GitHub Actions workflow (`.github/workflows/ci.yml`) automates infrastructure provisioning, test execution, and report publishing on each push or pull request.
- Store secrets such as Azure credentials in GitHub Secrets or a local envirnment variables. **Never commit secrets.**

---

## Best Practices

- **Azure:** Use resource groups for isolation and cost control. Clean up resources when not needed.
- **Terraform:** Use remote state storage (e.g., Azure Storage) for team collaboration and state management.
- **CI/CD:** Keep workflows modular and secure secrets.
- **Testing:** Separate UI, API, BDD, and Postman tests for clarity and maintainability. Use BDD for scenario-driven, human-readable test cases. Use Postman collections for API contract and workflow validation.
- **Reporting:** Ensure BDD, Postman, and other reports are accessible but secure (use SAS tokens or access policies if needed).

---

## License

This project is licensed under the [Creative Commons Attribution-NonCommercial 4.0 International License](https://creativecommons.org/licenses/by-nc/4.0/).

You may:
- Share, remix, and adapt the work, as long as it's for **non-commercial purposes only**.

You may not:
- Use this work for **commercial purposes**, including resale or profit-driven uses, without explicit permission from the author.

---

## Contact

For questions or contributions, please open an issue or contact the repository owner.

---

