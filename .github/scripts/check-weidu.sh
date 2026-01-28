#!/usr/bin/env bash
set -euo pipefail

SUPPORTED=(d tp2 tpa tpp)

main() {
  echo $1
  extension=$( echo "${1}" | awk -F '.' '{print $NF}' )
  if [[ " ${SUPPORTED[*]} " =~ [[:space:]]${extension}[[:space:]] ]]; then
    weidu --nogame --parse-check "${extension}" "${1}"
  fi
}

main $@
