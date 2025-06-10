#!/bin/bash

set -e

REPORTS_DIR="../reports"
STORAGE_ACCOUNT_NAME="qaplaywrightstorage"
CONTAINER="\$web"

echo "Uploading reports to Azure Storage static website..."

az storage blob upload-batch \
  --account-name "$STORAGE_ACCOUNT_NAME" \
  --destination "$CONTAINER" \
  --source "$REPORTS_DIR" \
  --overwrite \
  --destination-path ""

echo "Upload complete. Check your static site:"
az storage account show \
  --name "$STORAGE_ACCOUNT_NAME" \
  --query "primaryEndpoints.web" \
  --output tsv
