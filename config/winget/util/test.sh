#!/usr/bin/env bash

set -o pipefail

result_directory="result"
result_file="${result_directory}/test-result-$(date '+%Y%m%d-%H%M%S').txt"

mkdir -p "${result_directory}"

winget.exe configure test \
  --file "$(wslpath -w output/configuration.winget)" \
  2>&1 | tee "${result_file}"
