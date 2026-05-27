#!/usr/bin/env bash
set -euo pipefail

sudo apt-get update
sudo apt-get install -y nasm curl gdb gcc-multilib gnupg ca-certificates

curl -fsSL https://pgp.mongodb.com/server-8.0.asc \
  | sudo gpg --dearmor --yes -o /usr/share/keyrings/mongodb-server-8.0.gpg

echo "deb [ arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/mongodb-server-8.0.gpg ] https://repo.mongodb.org/apt/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME")/mongodb-org/8.0 multiverse" \
  | sudo tee /etc/apt/sources.list.d/mongodb-org-8.0.list >/dev/null

sudo apt-get update
sudo apt-get install -y mongodb-mongosh

printf '.mode table\n.headers on\n' > ~/.sqliterc
sqlite3 hogwarts.db < setup.sql
