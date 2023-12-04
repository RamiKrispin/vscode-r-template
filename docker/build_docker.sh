#!/bin/bash

echo "Build the docker"

docker build . -f Dockerfile \
               --progress=plain \
               --build-arg PROJECT_NAME="R Dev Env" \
               --build-arg VENV_NAME="R_ENV" \
               --build-arg R_VERSION_MAJOR=4 \
               --build-arg R_VERSION_MINOR=3 \
               --build-arg R_VERSION_PATCH=1 \
                --build-arg DEBIAN_FRONTEND=noninteractive \
                 --build-arg CRAN_MIRROR="https://cran.rstudio.com/" \
               --build-arg QUARTO_VER="1.3.450" \
               -t rkrispin/vscode_r_dev:0.1.0

if [[ $? = 0 ]] ; then
echo "Pushing docker..."
docker push rkrispin/vscode_r_dev:0.1.0
else
echo "Docker build failed"
fi
