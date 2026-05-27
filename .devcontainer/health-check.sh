#!/usr/bin/env bash
set -euo pipefail

echo "Running devcontainer health checks..."

command -v rustc >/dev/null
command -v cargo >/dev/null
command -v nasm >/dev/null
command -v sqlite3 >/dev/null
command -v mongosh >/dev/null

MONGO_HOST="${MONGO_HOST:-db}"
MONGO_PORT="${MONGO_PORT:-27017}"
MONGO_USER="${MONGO_INITDB_ROOT_USERNAME:-admin}"
MONGO_PASSWORD="${MONGO_INITDB_ROOT_PASSWORD:-password}"

mongosh --host "$MONGO_HOST" --port "$MONGO_PORT" \
  --username "$MONGO_USER" --password "$MONGO_PASSWORD" \
  --authenticationDatabase admin --quiet \
  --eval "const ok = db.adminCommand({ ping: 1 }).ok; if (ok !== 1) { throw new Error('MongoDB ping failed for ${MONGO_HOST}:${MONGO_PORT}'); }"

mongosh --host "$MONGO_HOST" --port "$MONGO_PORT" \
  --username "$MONGO_USER" --password "$MONGO_PASSWORD" \
  --authenticationDatabase admin --quiet \
  --eval "const seeded = db.getSiblingDB('newt_suitcase').creatures.countDocuments({}); if (seeded < 154) { throw new Error('MongoDB seed check failed: expected at least 154 documents, got ' + seeded); }"

sqlite3 hogwarts.db ".tables" >/dev/null

echo "Health checks passed: app tools and MongoDB service are stable."
