#!/usr/bin/env bash

set -ex
set -o pipefail

if [[ -z "$GITHUB_TOKEN" ]]; then
  echo "Set the GITHUB_TOKEN env variable."
  exit 1
fi

if [[ -z "$GITHUB_ISSUE_URL" ]]; then
  echo "Set the GITHUB_ISSUE_URL env variable."
  exit 1
fi

if [[ -z "$GITHUB_LABEL" ]]; then
  echo "Set the GITHUB_LABEL env variable."
  exit 1
fi

#Create Label on Pull Request
curl -X POST -H "Authorization: token $GITHUB_TOKEN" \
  --data "[\"$GITHUB_LABEL\"]" \
  $GITHUB_ISSUE_URL
