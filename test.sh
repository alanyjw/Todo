#! /bin/bash

SCHEME='Todo'
PROJECT='Todo.xcodeproj'
SDK='iphonesimulator9.3'
DESTINATION='platform=iOS Simulator,OS=9.3'

which -s xcpretty
XCPRETTY_INSTALLED=$?

TEST_CMD="xcodebuild -scheme $SCHEME -project $PROJECT -sdk $SDK build test"

if [[ $TRAVIS || $XCPRETTY_INSTALLED == 0 ]]; then
  eval "${TEST_CMD} | xcpretty"
else
  eval "$TEST_CMD"
fi
