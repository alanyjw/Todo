#! /bin/bash

SCHEME='Todo'
PROJECT='Todo.xcodeproj'
TEST_SDK='iphonesimulator9.3'

TEST_CMD="xctool -scheme $SCHEME -project $PROJECT test -test-sdk $TEST_SDK CODE_SIGN_IDENTITY=\"\" CODE_SIGNING_REQUIRED=NO"

eval "$TEST_CMD"
