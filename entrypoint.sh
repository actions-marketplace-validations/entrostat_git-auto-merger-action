#!/bin/sh -l

which git-auto-merger

# This is to fix the following error
# fatal: detected dubious ownership in repository at '/github/workspace'
# To add an exception for this directory, call:
#
#	git config --global --add safe.directory /github/workspace
git config --global --add safe.directory $(pwd)

set -x

INCLUDE_PATTERN_ENTRIES=$(node /scripts/convert-array-to-args.js $2 --include-pattern)
EXCLUDE_PATTERN_ENTRIES=$(node /scripts/convert-array-to-args.js $3 --exclude-pattern)

echo $INCLUDE_PATTERN_ENTRIES
echo $EXCLUDE_PATTERN_ENTRIES

git-auto-merger merge --base-branch=develop --include-pattern='develop$' --include-pattern='feature\/.*' --exclude-pattern='main'
