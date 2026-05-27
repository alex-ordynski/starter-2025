#!/usr/bin/env bash
set -euo pipefail

printf '.mode table\n.headers on\n' > ~/.sqliterc
sqlite3 hogwarts.db < setup.sql
