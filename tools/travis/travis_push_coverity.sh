#!/bin/bash
set -evE

function errorTrap(){
    echo -e "\n\n------------- Error -------------\n\nSee output above to find the cause."
    # Wait a bit until the stdout is flushed
    sleep 10
    exit 1
}
trap errorTrap ERR

# This script is run by travis-ci and pushes the first commit
# of the day to the coverity scan service

echo "=== Pushing ${TRAVIS_BRANCH} to coverity_scan branch ==="

COMMITS=`git log --oneline --since=today.midnight | wc -l`
if [ "$COMMITS" -le 1 ]; then
    git push https://$GITAUTH@github.com/open62541/open62541 master:coverity_scan
else
    echo "Not the first commit of the day - no push to coverity required"
fi
