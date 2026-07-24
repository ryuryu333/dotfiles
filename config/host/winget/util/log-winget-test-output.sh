#!/usr/bin/env bash

set -o pipefail

result_directory="result"
result_file="${result_directory}/test-result-$(date '+%Y%m%d-%H%M%S').txt"

mkdir -p "${result_directory}"
find "${result_directory}" -mindepth 1 -delete

tee "${result_file}"

awk '
  {
    gsub(/\r/, "")
    normalized_line = $0
    sub(/^[[:space:]]+/, "", normalized_line)
  }
  normalized_line == "システムは、記述された構成状態ではありません。" &&
    previous_non_empty_line ~ /^Microsoft\.[^ ]+ \[[^]]+\]$/ {
    failed_resources[++failed_resource_count] = previous_non_empty_line
  }
  $0 != "" {
    previous_non_empty_line = $0
  }
  END {
    print "====="
    print "不適合なリソース"
    if (failed_resource_count == 0) {
      print "なし"
    } else {
      for (resource_index = 1; resource_index <= failed_resource_count; resource_index++) {
        print failed_resources[resource_index]
      }
    }
    print "====="
  }
' "${result_file}" | tee -a "${result_file}"
