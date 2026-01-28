#!/usr/bin/env bash
set -euo pipefail

function main() {
  local duplicates=$( find . | sort -f | uniq -i -d )
  if [ "${duplicates}" -n ]; then
    echo -e "Duplicates found:\n${duplicates}"
    exit 1
  fi
}

main
