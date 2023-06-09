#!/bin/bash

set -e

export GROUP="{{GROUP}}"
export APPLICATION="{{APPLICATION}}"
export VERSION="$(git branch --show-current)"
export REVISION="$(git branch --show-current)-$(git rev-parse --short HEAD)"
export DESCRIPTION="Container Package Manager"
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

docker build --no-cache --file ./Dockerfile\
                        --build-arg group="$GROUP"\
                        --build-arg application="$APPLICATION"\
                        --build-arg version="$VERSION"\
                        --build-arg revision="$REVISION"\
                        --build-arg description="$DESCRIPTION"\
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
                        --tag $GROUP/$APPLICATION:$REVISION .

if [ "$1" != "" ]; then
  docker tag $GROUP/$APPLICATION:$REVISION $1/$GROUP/$APPLICATION:$REVISION
  docker push $1/$GROUP/$APPLICATION:$REVISION
  docker rmi $1/$GROUP/$APPLICATION:$REVISION
  docker rmi $GROUP/$APPLICATION:$REVISION
fi
