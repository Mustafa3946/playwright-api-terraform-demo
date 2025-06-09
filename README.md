
# playwright-api-terraform-demo

## Overview

This project is a demo for an Automation Engineer role showcasing end-to-end automated testing across UI and API layers, integrated with Infrastructure as Code (IaC) using Terraform on Azure, and Continuous Integration/Continuous Deployment (CI/CD) using GitHub Actions.

It demonstrates best practices for scalable test automation frameworks, infrastructure provisioning, and reporting, suitable for a professional cloud-based test automation pipeline.

---

## Tech Stack

| Layer        | Technology                        |
|--------------|---------------------------------|
| UI Testing   | Playwright (Node.js / TypeScript)|
| API Testing  | Postman (newman CLI) or REST-assured (Java) |
| Infrastructure as Code | Terraform (Azure)           |
| CI/CD        | GitHub Actions                  |
| Cloud        | Microsoft Azure (Free Tier)      |
| Reporting    | HTML Reports hosted on Azure Blob Storage Static Website |

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
│   ├── postman/
│   │   └── test_collection.json   # Postman collection for API tests
│   └── rest-assured/
│       └── ApiTest.java           # REST-assured Java test example
├── reports/
│   └── index.html                 # Generated HTML report accessible via static website
├── scripts/
│   └── upload_report.sh           # Script to upload reports to Azure Blob Storage
├── README.md                      # This file
└── .env                          # Environment variables (not committed)
```

---

## Features

- **Automated UI Testing**: Playwright for cross-browser functional tests.
- **Automated API Testing**: Postman or REST-assured for REST API validation.
- **Infrastructure Provisioning**: Terraform to create Azure resources including Storage Account for hosting reports.
- **CI/CD Pipeline**: GitHub Actions automates Terraform deployment, test execution, and report publishing.
- **Test Reporting**: HTML reports published to Azure Blob static website, providing accessible test results to stakeholders.
- **Cost-Effective**: Utilizes Azure free tier and open-source tools to minimize costs.

---

## Getting Started

### Prerequisites

- Azure account (free tier sufficient)
- Terraform installed locally
- Node.js installed (for Playwright)
- Java and Maven/Gradle (for REST-assured tests, optional)
- GitHub account for repository and Actions

### Setup Instructions

1. Clone the repository:

```bash
git clone https://github.com/your-username/playwright-api-terraform-demo.git
cd playwright-api-terraform-demo
```

2. Configure Terraform variables in `infra/variables.tf` or via environment variables.

3. Deploy Azure infrastructure:

```bash
cd infra
terraform init
terraform apply
```

4. Run Playwright UI tests:

```bash
cd ../playwright-tests
npm install
npx playwright test
```

5. Run API tests (choose Postman or REST-assured):

- Postman (using Newman):

```bash
cd ../api-tests/postman
newman run test_collection.json
```

- REST-assured (using Maven or Gradle):

```bash
cd ../api-tests/rest-assured
mvn test
```

6. Upload test reports to Azure Blob Storage:

```bash
cd ../scripts
bash upload_report.sh
```

7. Access reports at the Azure Blob Storage static website URL.

---

## CI/CD Integration

- The GitHub Actions workflow (`.github/workflows/ci.yml`) automates the above steps on each push or pull request.
- It applies Terraform changes, runs UI and API tests, then uploads reports automatically.

---

## Notes

- Keep secrets such as Azure credentials in GitHub Secrets or `.env` files (not committed).
- Modify test cases and infrastructure as needed to fit your specific project.
- Designed to be easily understandable by recruiters and technical stakeholders.

---

## License

MIT License

---

## Contact

For questions or contributions, please open an issue or contact the repository owner.

---

