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
export COMMIT_AUTHOR="$(git show -s --format='%an' HEAD)"
export COMMIT_AUTHOR_EMAIL="$(git show -s --format='%ae' HEAD)"
export BUILD="$(uuidgen)"

docker build --no-cache --file ./Dockerfile\
                        --build-arg group="$GROUP"\
                        --build-arg application="$APPLICATION"\
                        --build-arg description="$DESCRIPTION"\
                        --build-arg version="$VERSION"\
                        --build-arg repository="$REPOSITORY"\
                        --build-arg branch="$BRANCH"\
                        --build-arg commit="$COMMIT"\
                        --build-arg commit_before="$COMMIT_BEFORE"\
                        --build-arg commit_time="$COMMIT_TIME"\
                        --build-arg commit_timestamp="$COMMIT_TIMESTAMP"\
                        --build-arg commit_message="$COMMIT_MESSAGE"\
                        --build-arg commit_author="$COMMIT_AUTHOR"\
                        --build-arg commit_author_email="$COMMIT_AUTHOR_EMAIL"\
                        --build-arg build="$BUILD"\
                        --build-arg ci="$CI"\
                        --build-arg github_action="$GITHUB_ACTION"\
                        --build-arg github_action_path="$GITHUB_ACTION_PATH"\
                        --build-arg github_action_repository="$GITHUB_ACTION_REPOSITORY"\
                        --build-arg github_actions="$GITHUB_ACTIONS"\
                        --build-arg github_actor="$GITHUB_ACTOR"\
                        --build-arg github_actor_id="$GITHUB_ACTOR_ID"\
                        --build-arg github_api_url="$GITHUB_API_URL"\
                        --build-arg github_base_ref="$GITHUB_BASE_REF"\
                        --build-arg github_env="$GITHUB_ENV"\
                        --build-arg github_event_name="$GITHUB_EVENT_NAME"\
                        --build-arg github_event_path="$GITHUB_EVENT_PATH"\
                        --build-arg github_graphql_url="$GITHUB_GRAPHQL_URL"\
                        --build-arg github_head_ref="$GITHUB_HEAD_REF"\
                        --build-arg github_job="$GITHUB_JOB"\
                        --build-arg github_path="$GITHUB_PATH"\
                        --build-arg github_ref="$GITHUB_REF"\
                        --build-arg github_ref_name="$GITHUB_REF_NAME"\
                        --build-arg github_ref_protected="$GITHUB_REF_PROTECTED"\
                        --build-arg github_ref_type="$GITHUB_REF_TYPE"\
                        --build-arg github_repository="$GITHUB_REPOSITORY"\
                        --build-arg github_repository_id="$GITHUB_REPOSITORY_ID"\
                        --build-arg github_repository_owner="$GITHUB_REPOSITORY_OWNER"\
                        --build-arg github_repository_owner_id="$GITHUB_REPOSITORY_OWNER_ID"\
                        --build-arg github_retention_days="$GITHUB_RETENTION_DAYS"\
                        --build-arg github_run_attempt="$GITHUB_RUN_ATTEMPT"\
                        --build-arg github_run_id="$GITHUB_RUN_ID"\
                        --build-arg github_run_number="$GITHUB_RUN_NUMBER"\
                        --build-arg github_server_url="$GITHUB_SERVER_URL"\
                        --build-arg github_sha="$GITHUB_SHA"\
                        --build-arg github_step_summary="$GITHUB_STEP_SUMMARY"\
                        --build-arg github_workflow="$GITHUB_WORKFLOW"\
                        --build-arg github_workflow_ref="$GITHUB_WORKFLOW_REF"\
                        --build-arg github_workflow_sha="$GITHUB_WORKFLOW_SHA"\
                        --build-arg github_workspace="$GITHUB_WORKSPACE"\
                        --build-arg runner_arch="$RUNNER_ARCH"\
                        --build-arg runner_debug="$RUNNER_DEBUG"\
                        --build-arg runner_name="$RUNNER_NAME"\
                        --build-arg runner_os="$RUNNER_OS"\
                        --tag $GROUP/$APPLICATION:$VERSION .

if [ "$1" == "push" ]; then
  docker push $GROUP/$APPLICATION:$VERSION
  docker rmi $(docker images --filter "label=build=$BUILD" -q)
fi