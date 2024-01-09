#/usr/bin/bash

set -ex

git_ref=${GITHUB_REF}

mkdir ~/.ssh
chmod 700 ~/.ssh
ssh-keyscan github.com >> ~/.ssh/known_hosts
eval "$(ssh-agent -s)"

deploy_repo_push="origin"
git config user.email "noreply@deploy"
git config user.name "Deploy"

git checkout -b auto-ref-test-update

git add .
COMMIT_MESSAGE="Updating reference tests on $(date "+%Y-%m-%d %H:%M:%S")"
git commit -m "${COMMIT_MESSAGE}"
git push origin auto-ref-test-update:auto-ref-test-update -f
