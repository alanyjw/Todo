#! /bin/bash

SDK="iphonesimulator"
DESTINATION='platform=iOS Simulator,name=iPhone 6S,OS=9.3'

TEST_CMD="xcodebuild "\
"-sdk $SDK "\
"-destination $DESTINATION "\
"build test"

which -s xcpretty
XCPRETTY_INSTALLED=$?

if [[ $TRAVIS || $XCPRETTY_INSTALLED == 0 ]]; then
  eval "${TEST_CMD} | xcpretty"
else
  eval "$TEST_CMD"
fi
