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

mongosh --host "$MONGO_HOST" --port "$MONGO_PORT" \
  --quiet \
  --eval "const host = '${MONGO_HOST}:${MONGO_PORT}'; const ok = db.adminCommand({ ping: 1 }).ok; if (ok !== 1) { throw new Error('MongoDB ping failed for ' + host); }"

mongosh --host "$MONGO_HOST" --port "$MONGO_PORT" \
  --quiet \
  --eval "const MIN_EXPECTED_CREATURES = 154; const seeded = db.getSiblingDB('newt_suitcase').creatures.countDocuments({}); if (seeded < MIN_EXPECTED_CREATURES) { throw new Error('MongoDB seed check failed: expected at least ' + MIN_EXPECTED_CREATURES + ' documents, got ' + seeded); }"

sqlite3 hogwarts.db ".tables" >/dev/null

echo "Health checks passed: app tools and MongoDB service are stable."
