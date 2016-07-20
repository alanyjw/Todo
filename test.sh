#! /bin/bash

SCHEME='Todo'
PROJECT='Todo.xcodeproj'
TEST_SDK='iphonesimulator9.3'

which -s xcpretty
XCPRETTY_INSTALLED=$?

TEST_CMD="xctool -scheme $SCHEME -project $PROJECT test -test-sdk $TEST_SDK"

eval "$TEST_CMD"
