FROM alpine:3.18.2

ARG group
ARG application
ARG version
ARG revision
ARG description
ARG license
ARG company
ARG web
ARG repository
ARG branch
ARG commit
ARG commit_time
ARG commit_message
ARG commit_author
ARG commit_author_email
ARG build
ARG build_time
ARG os
ARG arch
ARG dependencies

LABEL group="$group"
LABEL application="$application"
LABEL version="$version"
LABEL revision="$revision"
LABEL description="$description"
LABEL license="$license"
LABEL company="$company"
LABEL web="$web"
LABEL repository="$repository"
LABEL branch="$branch"
LABEL commit="$commit"
LABEL commit_time="$commit_time"
LABEL commit_message="$commit_message"
LABEL commit_author="$commit_author"
LABEL commit_author_email="$commit_author_email"
LABEL build="$build"
LABEL build_time="$build_time"
LABEL os="$os"
LABEL arch="$arch"
LABEL dependencies="$dependencies"
LABEL fly_version="$version"

ENV GROUP="$group"
ENV APPLICATION="$application"
ENV VERSION="$version"
ENV REVISION="$revision"
ENV DESCRIPTION="$description"
ENV LICENSE="$license"
ENV COMPANY="$company"
ENV WEB="$web"
ENV REPOSITORY="$repository"
ENV BRANCH="$branch"
ENV COMMIT="$commit"
ENV COMMIT_TIME="$commit_time"
ENV COMMIT_MESSAGE="$commit_message"
ENV COMMIT_AUTHOR="$commit_author"
ENV COMMIT_AUTHOR_EMAIL="$commit_author_email"
ENV BUILD="$build"
ENV BUILD_TIME="$build_time"
ENV OS="$os"
ENV ARCH="$arch"
ENV DEPENDENCIES="$dependencies"
ENV FLY_VERSION="$version"

RUN set -e\
 && apk update --no-cache\
 && apk upgrade --no-cache\
 && apk add --no-cache bash uuidgen curl wget busybox-extras minio-client postgresql15-client\
 && mkdir /act /conf /out /pack /param /templ

COPY --chmod=755 ./bin/fly /bin/fly
COPY --chmod=644 ./templ/Dockerfile /templ/Dockerfile
COPY --chmod=755 ./templ/build.sh /templ/build.sh

WORKDIR /pack

ENTRYPOINT ["/bin/fly"]
