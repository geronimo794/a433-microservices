#/bin/bash

# Show all command and variable value
set -x

# Load configuration from .env file
set -o allexport
# If .env not exist then use format.env
if [ ! -f .env ]; then
	source format.env
else
	source .env
fi
set +o allexport

# Hide all command and variable value again
set +x

# Build image from Docker file with name "item-app" and tag "v1"
# You can see it from .env configuration
docker build --pull --rm -f "Dockerfile" -t $IMAGE_REPO_NAME:$IMAGE_TAG "."

# Show all list of docker iamge
docker image ls

# Define full new image name, with registry, namespace, repo
FULL_NEW_IMAGE_NAME=$GITHUB_REGISTRY/$GITHUB_USERNAME/$IMAGE_REPO_NAME:$IMAGE_TAG

# Rename previous image repo with new repo and tag
docker tag $IMAGE_REPO_NAME:$IMAGE_TAG $FULL_NEW_IMAGE_NAME

# Login with saved Personal Access Token and Github Username
# You can configure it via .env file
echo $GITHUB_PAT | docker login ghcr.io --username $GITHUB_USERNAME --password-stdin

# Push the image to github registry
docker push $FULL_NEW_IMAGE_NAME
