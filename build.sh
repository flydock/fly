#!/bin/bash

set -e

export GROUP="flypackdev"
export APPLICATION="fly"
export DESCRIPTION="Container Package Manager"
export VERSION="$(git branch --show-current)-$(git rev-parse --short HEAD)"
export REPOSITORY="https://github.com/flydock/fly.git"
export BRANCH="$(git branch --show-current)"
export COMMIT="$(git rev-parse HEAD)"
export COMMIT_BEFORE="$(git rev-parse HEAD^1)"
export COMMIT_TIME="$(git show -s --format='%ci' HEAD)"
export COMMIT_TIMESTAMP="$(git show -s --format='%ct' HEAD)"
export COMMIT_MESSAGE="$(git show -s --format='%B' HEAD)"
export MAINTAINER="$(git show -s --format='%an' HEAD)"
export MAINTAINER_EMAIL="$(git show -s --format='%ae' HEAD)"
export BUILD="$(uuidgen)"

if [ "$1" == "push" ]; then
  docker push $GROUP/$APPLICATION:$VERSION
  docker rmi $(docker images --filter "label=build=$BUILD" -q)
fi
