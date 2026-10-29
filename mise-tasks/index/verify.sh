#!/usr/bin/env bash
#MISE description="Verify a nonempty package index and positive archived file count"
set -euo pipefail

case "${INDEX_COUNT:-}" in
'' | *[!0-9]*)
  echo "INDEX_COUNT must be a strictly positive integer" >&2
  exit 1
  ;;
esac
if [ "$INDEX_COUNT" -le 0 ]; then
  echo "INDEX_COUNT must be a strictly positive integer" >&2
  exit 1
fi
if [ -z "${INDEX_DIR:-}" ] || [ ! -s "$INDEX_DIR/simple/index.html" ]; then
  echo "INDEX_DIR must contain a nonempty simple/index.html" >&2
  exit 1
fi

echo "Verified ${INDEX_COUNT} archived distributions in ${INDEX_DIR}/simple/"
