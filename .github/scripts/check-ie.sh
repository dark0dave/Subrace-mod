#!/usr/bin/env bash
set -euo pipefail

function checkIE() {
  declare -i count=0
  declare -i badfiles=0

  for file in $(find subrace/. -type f -iname "${1}" ); do
    [[ $( basename "${file}" | cut -f1 -d '.' | wc | awk '{ print $3}' ) -gt 9 ]] && echo "Error found: ${file} which is larger than 8 characters" && badfiles+=1;
    count+=1;
  done

  [[ "${badfiles}" -gt 0 ]] && echo "Failed found bad files" && exit 1;

  echo "Checked ${count} files"
}

main() {
  checkIE "*bam"
  checkIE "*baf"
  checkIE "*cre"
  checkIE "*d"
  checkIE "*itm"
  checkIE "*spl"
  checkIE "*sto"
  checkIE "*wav"
  checkIE "*vvc"
}

main
