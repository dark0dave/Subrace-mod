#!/usr/bin/env bash
set -euo pipefail

function duplicateTraNumbers() {
  test -z "$(find . -iname "*.tra" -type f | grep "${1}" | xargs -I {} cat {} | grep "@" | awk '{print $1}' | sort -f | uniq -i -d)"
}

function main() {
  lang=$(echo "subrace/lang/en_us/kenku.tra" | awk -F '/' '{print $3}')
  duplicateTraNumbers "${lang}"
}

main $@
