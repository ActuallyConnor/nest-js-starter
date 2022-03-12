#!/bin/bash
# This script performs a basic uptime check on the CDB service, then runs integration tests through Jest

set -e

# And run tests
TEST_ENDPOINT="${TEST_ENDPOINT:-http://node:3000}"

# commented code not currently working

# Wait for services (max 2 minutes)
#echo "Waiting for service at $TEST_ENDPOINT"
#while test "$(curl -s "$TEST_ENDPOINT"/health-check?full=1 | jq .healthy)" == "false"; do
#  echo 'Waiting...'
#  ((c++)) && ((c == 30)) && break
#  sleep 5
#done
#
## Guard failure
#if test "$(curl -s "$TEST_ENDPOINT"/health-check?full=1 | jq .healthy)" == "false"; then
#  echo "Service at $TEST_ENDPOINT unavailable after 2.5 minutes, exiting"
#  exit 1
#fi

## Otherwise, is available
#echo "Service at $TEST_ENDPOINT available, running tests"

# Add run tests
TEST_ENDPOINT=$TEST_ENDPOINT npm test
