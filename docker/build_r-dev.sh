#!/usr/bin/env bash

echo "Build the docker"

# Parameters
user_name="rkrispin"
image_label="r-dev"

# Setting the image name
ver=0.0.1
docker_file=Dockerfile.r-dev
image_name=$user_name/$image_label:$ver

echo "Image name: $image_name"

# Build
docker build . \
  -f $docker_file --progress=plain \
  --platform linux/amd64,linux/arm64 \
   -t $image_name

# Push
if [[ $? = 0 ]] ; then
echo "Pushing docker..."
docker push $image_name
else
echo "Docker build failed"
fi