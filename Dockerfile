FROM alpine:3.18.0

ARG group
ARG application
ARG version
ARG revision
ARG description
ARG company
ARG web
ARG repository
ARG branch
ARG commit
ARG commit_before
ARG commit_time
ARG commit_timestamp
ARG commit_message
ARG commit_author
ARG commit_author_email
ARG build
ARG github_action
ARG github_action_repository
ARG github_actor
ARG github_base_ref
ARG github_event_name
ARG github_event_path
ARG github_head_ref
ARG github_job
ARG github_ref
ARG github_ref_name
ARG github_ref_type
ARG github_repository
ARG github_repository_owner
ARG github_run_id
ARG github_run_number
ARG github_server_url
ARG github_sha
ARG github_workflow
ARG github_workflow_ref
ARG github_workflow_sha
ARG runner_arch
ARG runner_name
ARG runner_os

LABEL group="$group"
LABEL application="$application"
LABEL version="$version"
LABEL revision="$revision"
LABEL description="$description"
LABEL company="$company"
LABEL web="$web"
LABEL repository="$repository"
LABEL branch="$branch"
LABEL commit="$commit"
LABEL commit_before="$commit_before"
LABEL commit_time="$commit_time"
LABEL commit_timestamp="$commit_timestamp"
LABEL commit_message="$commit_message"
LABEL commit_author="$commit_author"
LABEL commit_author_email="$commit_author_email"
LABEL build="$build"
LABEL github_action="$github_action"
LABEL github_action_repository="$github_action_repository"
LABEL github_actor="$github_actor"
LABEL github_base_ref="$github_base_ref"
LABEL github_event_name="$github_event_name"
LABEL github_event_path="$github_event_path"
LABEL github_head_ref="$github_head_ref"
LABEL github_job="$github_job"
LABEL github_ref="$github_ref"
LABEL github_ref_name="$github_ref_name"
LABEL github_ref_type="$github_ref_type"
LABEL github_repository="$github_repository"
LABEL github_repository_owner="$github_repository_owner"
LABEL github_run_id="$github_run_id"
LABEL github_run_number="$github_run_number"
LABEL github_server_url="$github_server_url"
LABEL github_sha="$github_sha"
LABEL github_workflow="$github_workflow"
LABEL github_workflow_ref="$github_workflow_ref"
LABEL github_workflow_sha="$github_workflow_sha"
LABEL runner_arch="$runner_arch"
LABEL runner_name="$runner_name"
LABEL runner_os="$runner_os"

ENV GROUP="$group"
ENV APPLICATION="$application"
ENV VERSION="$version"
ENV REVISION="$revision"
ENV DESCRIPTION="$description"
ENV COMPANY="$company"
ENV WEB="$web"
ENV REPOSITORY="$repository"
ENV BRANCH="$branch"
ENV COMMIT="$commit"
ENV COMMIT_BEFORE="$commit_before"
ENV COMMIT_TIME="$commit_time"
ENV COMMIT_TIMESTAMP="$commit_timestamp"
ENV COMMIT_MESSAGE="$commit_message"
ENV COMMIT_AUTHOR="$commit_author"
ENV COMMIT_AUTHOR_EMAIL="$commit_author_email"
ENV BUILD="$build"
ENV GITHUB_ACTION="$github_action"
ENV GITHUB_ACTION_REPOSITORY="$github_action_repository"
ENV GITHUB_ACTOR="$github_actor"
ENV GITHUB_BASE_REF="$github_base_ref"
ENV GITHUB_EVENT_NAME="$github_event_name"
ENV GITHUB_EVENT_PATH="$github_event_path"
ENV GITHUB_HEAD_REF="$github_head_ref"
ENV GITHUB_JOB="$github_job"
ENV GITHUB_REF="$github_ref"
ENV GITHUB_REF_NAME="$github_ref_name"
ENV GITHUB_REF_TYPE="$github_ref_type"
ENV GITHUB_REPOSITORY="$github_repository"
ENV GITHUB_REPOSITORY_OWNER="$github_repository_owner"
ENV GITHUB_RUN_ID="$github_run_id"
ENV GITHUB_RUN_NUMBER="$github_run_number"
ENV GITHUB_SERVER_URL="$github_server_url"
ENV GITHUB_SHA="$github_sha"
ENV GITHUB_WORKFLOW="$github_workflow"
ENV GITHUB_WORKFLOW_REF="$github_workflow_ref"
ENV GITHUB_WORKFLOW_SHA="$github_workflow_sha"
ENV RUNNER_ARCH="$runner_arch"
ENV RUNNER_NAME="$runner_name"
ENV RUNNER_OS="$runner_os"

RUN set -e\
 && apk update --no-cache\
 && apk upgrade --no-cache\
 && apk add --no-cache bash uuidgen curl wget busybox-extras\
 && mkdir /act /conf /pack /param

COPY --chmod=755 ./bin/fly /bin/fly

WORKDIR /pack

ENTRYPOINT ["/bin/fly"]
