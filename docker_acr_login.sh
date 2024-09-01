#!/bin/bash

# ############
# Make the script executable by running:
# chmod +x docker_acr_login.sh
# 
# You can now run the script with:
# ./docker_acr_login.sh
# #############

# Log in to Azure Container Registry
echo $ACR_PASSWORD | docker login $ACR_NAME.azurecr.io -u $ACR_USERNAME --password-stdin

# Check if the login was successful
if [ $? -eq 0 ]; then
  echo "Successfully logged in to Azure Container Registry: $ACR_NAME.azurecr.io"
else
  echo "Failed to log in to Azure Container Registry: $ACR_NAME.azurecr.io"
  exit 1  # Exit the script with an error code
fi
