#!/bin/bash -x

if [[ $(git diff-tree --no-commit-id --name-only -r HEAD | grep "circle.yml" | wc -l) -gt 0 ]]; then
  MSG="Circle YAML was modified since last build"
  echo $MSG
  curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"${MSG}\"}" $SLACK_URL
fi
