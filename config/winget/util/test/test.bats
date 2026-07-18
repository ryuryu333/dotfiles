#!/usr/bin/env bats

@test "records and displays the test result" {
  cd "${BATS_TEST_TMPDIR}"

  bash "${BATS_TEST_DIRNAME}/../log-winget-test-output.sh" \
    < "${BATS_TEST_DIRNAME}/case/case1.txt" \
    > output.txt

  diff --strip-trailing-cr "${BATS_TEST_DIRNAME}/case/case1-exp.txt" output.txt
  diff --strip-trailing-cr "${BATS_TEST_DIRNAME}/case/case1-exp.txt" result/test-result-*.txt
}
