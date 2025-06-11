provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "qa" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "qa_reports" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.qa.name
  location                 = azurerm_resource_group.qa.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  static_website {
    index_document = "index.html"
    error_404_document = "404.html"
  }
}

output "static_website_url" {
  # Outputs the primary endpoint for the static website
  value = azurerm_storage_account.qa_reports.primary_web_endpoint
}
