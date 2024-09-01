#!/bin/bash

# ############
# Make the script executable by running:
# chmod +x docker_tag_and_push.sh
# 
# You can now run the script with:
# ./docker_tag_and_push.sh
# 
# #############

# Load environment variables from .env file
export $(grep -v '^#' .env | xargs)

# Tag the Docker image with the Azure Container Registry name
# 
# docker tag ${IMAGE_NAME} ${ACR_NAME}.azurecr.io/${IMAGE_NAME}:${TAG}
# echo "Image is taged"

# Push the tagged image to the Azure Container Registry
# 
docker push ${ACR_NAME}.azurecr.io/${IMAGE_NAME}:${TAG}
echo "Image ${IMAGE_NAME}:${TAG} has been successfully pushed to ${ACR_NAME}.azurecr.io/${IMAGE_NAME}:${TAG}"
