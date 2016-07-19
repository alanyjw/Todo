#! /bin/bash

SCHEME='Todo'
PROJECT='Todo.xcodeproj'
SDK='iphonesimulator'
DESTINATION='platform=iOS Simulator,name=iPhone 6S,OS=9.3'

which -s xcpretty
XCPRETTY_INSTALLED=$?

TEST_CMD="xcodebuild -scheme $SCHEME -project $PROJECT -sdk $SDK -destination '$DESTINATION' build test"

if [[ $TRAVIS || $XCPRETTY_INSTALLED == 0 ]]; then
  eval "${TEST_CMD} | xcpretty"
else
  eval "$TEST_CMD"
fi
