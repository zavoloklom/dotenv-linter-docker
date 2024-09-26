FROM alpine:3.20.3 AS alpine-version

ARG DOTENV_LINTER_VERSION="0.0.0"

RUN apk update && apk upgrade && \
    apk add --no-cache \
    git \
    curl \
    grep \
    && rm -rf /tmp/* /var/cache/apk/*

# Install dotenv-linter
SHELL ["/bin/ash", "-o", "pipefail", "-c"]
RUN curl -sSfL https://git.io/JLbXn | ash -s -- -b /usr/local/bin v${DOTENV_LINTER_VERSION}

WORKDIR /app

ENTRYPOINT ["/usr/local/bin/dotenv-linter"]

ARG BUILD_DATE="0000-00-00T00:00:00+0000"
ARG BUILD_REVISION="0000000"

LABEL \
  org.opencontainers.image.title="Dotenv Linter Alpine" \
  org.opencontainers.image.description="Lightning-fast linter for .env files. Written in Rust." \
  org.opencontainers.image.created="${BUILD_DATE}" \
  org.opencontainers.image.authors="Sergey Kupletsky <s.kupletsky@gmail.com>" \
  org.opencontainers.image.url="https://github.com/zavoloklom/dotenv-linter-docker" \
  org.opencontainers.image.documentation="https://github.com/zavoloklom/dotenv-linter-docker" \
  org.opencontainers.image.source="https://github.com/zavoloklom/dotenv-linter-docker.git" \
  org.opencontainers.image.version="${DOTENV_LINTER_VERSION}" \
  org.opencontainers.image.revision="${BUILD_REVISION}" \
  org.opencontainers.image.vendor="Sergey Kupletsky" \
  org.opencontainers.image.licenses="MIT"

FROM busybox:1.36.1-musl AS busybox-version

COPY --from=alpine-version /usr/local/bin/dotenv-linter /usr/local/bin/dotenv-linter

WORKDIR /app

ENTRYPOINT ["/usr/local/bin/dotenv-linter"]

ARG DOTENV_LINTER_VERSION="0.0.0"
ARG BUILD_DATE="0000-00-00T00:00:00+0000"
ARG BUILD_REVISION="0000000"

LABEL \
  org.opencontainers.image.title="Dotenv Linter BusyBox" \
  org.opencontainers.image.description="Lightning-fast linter for .env files. Written in Rust." \
  org.opencontainers.image.created="${BUILD_DATE}" \
  org.opencontainers.image.authors="Sergey Kupletsky <s.kupletsky@gmail.com>" \
  org.opencontainers.image.url="https://github.com/zavoloklom/dotenv-linter-docker" \
  org.opencontainers.image.documentation="https://github.com/zavoloklom/dotenv-linter-docker" \
  org.opencontainers.image.source="https://github.com/zavoloklom/dotenv-linter-docker.git" \
  org.opencontainers.image.version="${DOTENV_LINTER_VERSION}" \
  org.opencontainers.image.revision="${BUILD_REVISION}" \
  org.opencontainers.image.vendor="Sergey Kupletsky" \
  org.opencontainers.image.licenses="MIT"
