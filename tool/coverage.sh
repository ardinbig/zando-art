#!/bin/bash

# This script can be used to run flutter test for a given directory (defaults to the current directory)
# It will exclude generated code and translations (mimicking the ci) and open the coverage report in a
# new window once it has run successfully.
#
# To run in main project:
# ./tool/coverage.sh
#
# To run in other directory:
# ./tool/coverage.sh ./path/to/other/project

set -e

PROJECT_PATH="${1:-.}"
PROJECT_COVERAGE=./coverage/lcov.info

# Check if running on Windows
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" || "$OSTYPE" == "cygwin" ]]; then
    RM_CMD="rmdir /s /q"
    OPEN_CMD="start"
    VERY_GOOD_CMD="very_good.bat"
else
    RM_CMD="rm -rf"
    OPEN_CMD="open"
    VERY_GOOD_CMD="very_good"
fi

cd "${PROJECT_PATH}"

$RM_CMD coverage 2>/dev/null || true
fvm flutter --version
$VERY_GOOD_CMD test --coverage --exclude-coverage "**/*.g.dart **/*.gen.dart **/l10n/*.dart **/l10n/**/*.dart **/main/bootstrap.dart" --exclude-tags 'presubmit-only' --test-randomize-ordering-seed random

lcov --remove "${PROJECT_COVERAGE}" -o "${PROJECT_COVERAGE}" \
    '**/*.g.dart' \
    '**/l10n/*.dart' \
    '**/l10n/**/*.dart' \
    '**/main/bootstrap.dart' \
    '**/*.gen.dart'

genhtml "${PROJECT_COVERAGE}" -o coverage | tee ./coverage/output.txt

COV_LINE=$(tail -2 ./coverage/output.txt | head -1)
SUB='100.0%'

if [[ "$COV_LINE" == *"$SUB"* ]]; then
    echo "The coverage is 100%"
else
    echo "Coverage is below 100%! Check the report to see which lines are not covered."
    echo "$COV_LINE"
    $OPEN_CMD ./coverage/index.html
fi
