#!/bin/bash

set -e

if [ "$1" != "amd64" ] && [ "$1" != "arm64" ]; then
  echo "./build.sh amd64|arm64"
  exit 1
fi

export GROUP="flydock"
export APPLICATION="fly"
export VERSION="$(git branch --show-current)"
export REVISION="$(git branch --show-current)-$(git rev-parse --short HEAD)"
export DESCRIPTION="Container Package Manager"
export LICENSE="Apache License 2.0"
export COMPANY="KubFly, Inc."
export WEB="https://kubfly.com/fly"
export REPOSITORY="https://github.com/flydock/fly.git"
export BRANCH="$(git branch --show-current)"
export COMMIT="$(git rev-parse HEAD)"
export COMMIT_TIME="$(git show -s --format='%ci' HEAD)"
export COMMIT_MESSAGE="$(git show -s --format='%B' HEAD)"
export COMMIT_AUTHOR="$(git show -s --format='%an' HEAD)"
export COMMIT_AUTHOR_EMAIL="$(git show -s --format='%ae' HEAD)"
export BUILD="$(uuidgen)"
export BUILD_TIME="$(date +"%Y-%m-%d %H:%M:%S %z")"
export OS="linux"
export ARCH="$1"
export DEPENDENCIES="[]"

podman buildx build --no-cache --file ./Dockerfile --platform $OS/$ARCH\
                    --build-arg group="$GROUP"\
                    --build-arg application="$APPLICATION"\
                    --build-arg version="$VERSION"\
                    --build-arg revision="$REVISION"\
                    --build-arg description="$DESCRIPTION"\
                    --build-arg license="$LICENSE"\
                    --build-arg company="$COMPANY"\
                    --build-arg web="$WEB"\
                    --build-arg repository="$REPOSITORY"\
                    --build-arg branch="$BRANCH"\
                    --build-arg commit="$COMMIT"\
                    --build-arg commit_time="$COMMIT_TIME"\
                    --build-arg commit_message="$COMMIT_MESSAGE"\
                    --build-arg commit_author="$COMMIT_AUTHOR"\
                    --build-arg commit_author_email="$COMMIT_AUTHOR_EMAIL"\
                    --build-arg build="$BUILD"\
                    --build-arg build_time="$BUILD_TIME"\
                    --build-arg os="$OS"\
                    --build-arg arch="$ARCH"\
                    --build-arg dependencies="$DEPENDENCIES"\
                    --tag $GROUP/$APPLICATION:$REVISION .

if [ "$2" != "" ]; then
  podman tag $GROUP/$APPLICATION:$REVISION $2/$GROUP/$APPLICATION:$REVISION
  podman push $2/$GROUP/$APPLICATION:$REVISION
  podman rmi $2/$GROUP/$APPLICATION:$REVISION
  podman rmi $GROUP/$APPLICATION:$REVISION
fi
