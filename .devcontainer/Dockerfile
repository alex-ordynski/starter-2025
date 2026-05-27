FROM mcr.microsoft.com/devcontainers/base:ubuntu

RUN apt-get update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    ca-certificates \
    curl \
    gnupg \
    nasm \
    sqlite3 \
    libsqlite3-dev \
    build-essential \
    gdb \
    gcc-multilib \
    make \
    && curl -fsSL https://pgp.mongodb.com/server-8.0.asc \
    | gpg --dearmor --yes -o /usr/share/keyrings/mongodb-server-8.0.gpg \
    && echo "deb [ arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/mongodb-server-8.0.gpg ] https://repo.mongodb.org/apt/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME")/mongodb-org/8.0 multiverse" \
    > /etc/apt/sources.list.d/mongodb-org-8.0.list \
    && apt-get update \
    && apt-get -y install --no-install-recommends mongodb-mongosh \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*
