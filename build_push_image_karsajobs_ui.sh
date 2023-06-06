#/bin/bash

# Show all command and variable value
set -x

# Load configuration from .env file
set -o allexport

# If .env not exist then use format.env
if [ -f local.env ]; then
	source local.env
else
	echo "Please populate the local.env file from format.env"
	exit
fi
set +o allexport

# Hide all command and variable value again
set +x

# Build image from Docker file with var $KARSA_JOB_FE_REPO_NAME and tag $KARSA_JOB_TAG
# You can see it from .env configuration
docker build --pull --rm -f "Dockerfile" -t $KARSA_JOB_FE_REPO_NAME:$KARSA_JOB_TAG "."

# Show all list of docker iamge
docker image ls

# Define full new image name, with registry, namespace, repo
FULL_NEW_IMAGE_NAME=$GITHUB_REGISTRY/$GITHUB_USERNAME/$KARSA_JOB_FE_REPO_NAME:$KARSA_JOB_TAG

# Rename previous image repo with new repo and tag
docker tag $KARSA_JOB_FE_REPO_NAME:$KARSA_JOB_TAG $FULL_NEW_IMAGE_NAME

# Login with saved Personal Access Token and Github Username
# You can configure it via .env file
echo $GITHUB_PAT | docker login ghcr.io --username $GITHUB_USERNAME --password-stdin

# Push the image to github registry
docker push $FULL_NEW_IMAGE_NAME
