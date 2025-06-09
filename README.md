# playwright-api-terraform-demo

## Overview

This project demonstrates a modern, cloud-based test automation pipeline that integrates end-to-end UI and API testing with Infrastructure as Code (IaC) using Terraform on Azure, and CI/CD via GitHub Actions.

It follows best practices for scalable test automation, infrastructure provisioning, and reporting—ideal for professional, cloud-native QA workflows.

---

## Tech Stack

| Layer                  | Technology                                      |
|------------------------|------------------------------------------------|
| UI Testing             | Playwright (Node.js / TypeScript)              |
| API Testing            | Python (`pytest` + `requests`)                 |
| Infrastructure as Code | Terraform (Azure)                              |
| CI/CD                  | GitHub Actions                                 |
| Cloud                  | Microsoft Azure (Free Tier)                    |
| Reporting              | HTML Reports on Azure Blob Storage Static Site |

---

## Architecture Diagram

```text
                        +----------------------+
                        |   GitHub Repository  |
                        +----------------------+
                                 |
                                 | CI/CD Trigger (Push/PR)
                                 v
                        +----------------------+
                        |  GitHub Actions      |
                        | - Terraform apply    |
                        | - Run tests          |
                        | - Upload reports     |
                        +----------------------+
                                 |
       +-------------------------+---------------------------+
       |                         |                           |
       v                         v                           v
+---------------+     +------------------+        +--------------------------+
| Azure Storage |     | Playwright Tests |        | Python API Tests         |
| Static Website|     | (UI Functional)  |        | (`pytest` + `requests`)  |
+---------------+     +------------------+        +--------------------------+
       |
       v
+--------------------------+
| HTML Report Public Link  |
| (Accessible to recruiter)|
+--------------------------+
```

---

## Folder Structure

```
playwright-api-terraform-demo/
├── .github/
│   └── workflows/
│       └── ci.yml                 # GitHub Actions workflow
├── infra/
│   ├── main.tf                    # Terraform: resource group, storage account, etc.
│   └── variables.tf               # Terraform variables
├── playwright-tests/
│   ├── tests/
│   │   └── login.spec.ts          # Sample UI test
│   └── playwright.config.ts       # Playwright config file
├── api-tests/
│   ├── python/
│   │   ├── tests/
│   │   │   └── test_api.py        # Sample Python API test
│   │   └── requirements.txt       # Python dependencies
├── reports/
│   └── index.html                 # Generated HTML report (static site)
├── scripts/
│   └── upload_report.sh           # Script to upload reports to Azure Blob Storage
├── README.md                      # This file
└── .env                           # Environment variables (not committed)
```

---

## Features

- **Automated UI Testing:** Playwright for fast, reliable cross-browser functional tests.
- **Automated API Testing:** Python (pytest + requests) for REST API validation.
- **Infrastructure Provisioning:** Terraform to create and manage Azure resources, including Storage Account for hosting reports.
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
    ```

5. **Run API tests:**
    ```bash
    cd ../api-tests/python
    python -m venv venv
    venv\Scripts\activate           # On Windows
    # source venv/bin/activate      # On macOS/Linux
    pip install -r requirements.txt
    pytest --html=../../reports/api_test_report.html
    ```

6. **Upload test reports to Azure Blob Storage:**
    ```bash
    cd ../../scripts
    bash upload_report.sh
    ```

7. **Access reports** at the Azure Blob Storage static website URL.

---

## CI/CD Integration

- The GitHub Actions workflow (`.github/workflows/ci.yml`) automates infrastructure provisioning, test execution, and report publishing on each push or pull request.
- Store secrets such as Azure credentials in GitHub Secrets or a local `.env` file (never commit secrets).

---

## Best Practices

- **Azure:** Use resource groups for isolation and cost control. Clean up resources when not needed.
- **Terraform:** Use remote state storage (e.g., Azure Storage) for team collaboration and state management.
- **CI/CD:** Keep workflows modular and secure secrets.
- **Testing:** Separate UI and API tests for clarity and maintainability.
- **Reporting:** Ensure reports are accessible but secure (use SAS tokens or access policies if needed).

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

