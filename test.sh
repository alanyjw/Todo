#! /bin/bash

SCHEME="Todo"
PROJECT="Todo.xcodeproj"
TEST_SDK="iphonesimulator10.0"

xcodebuild \
  -scheme $SCHEME \
  -project $PROJECT \
  -destination 'platform=iOS Simulator,name=iPhone 6s,OS=9.3' \
  -sdk $TEST_SDK \
  clean build test \
  CODE_SIGN_IDENTITY="" \
  CODE_SIGNING_REQUIRED=NO \
  > /tmp/output 2>&1

if [ $? -ne 0 ]; then
  cat /tmp/output
  exit 1
fi

cat /tmp/output | xcpretty
