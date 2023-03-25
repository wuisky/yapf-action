#!/bin/sh
set -e
export REVIEWDOG_GITHUB_API_TOKEN="${INPUT_GITHUB_TOKEN}"

echo "Checking formatting for $GITHUB_REPOSITORY"
sh -c "yapf --diff --recursive $GITHUB_WORKSPACE $*" | \
    reviewdog -name=yapf-action -f=diff -tee \
              -reporter="${INPUT_REPORTER}" \
              -filter-mode="${INPUT_FILTER_MODE}" \
              -fail-on-error="${INPUT_FAIL_ON_ERROR}" \
              -level="${INPUT_LEVEL}" \
              ${INPUT_REVIEWDOG_FLAGS}
