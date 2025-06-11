# Path: infra/variables.tf
# Purpose: Define input variables for Azure resource group and storage account provisioning.

variable "resource_group_name" {
  default = "qa-playwright-rg"
}

variable "location" {
  default = "australiaeast"
}

variable "storage_account_name" {
  default = "qaplaywrightstorage"
}
