#! /bin/bash

SCHEME="Todo"
PROJECT="Todo.xcodeproj"
TEST_SDK="iphonesimulator10.0"

mkdir -p .log

xcodebuild \
  -scheme $SCHEME \
  -project $PROJECT \
  -destination 'platform=iOS Simulator,name=iPhone 6s,OS=10.0' \
  -sdk $TEST_SDK \
  clean build test \
  CODE_SIGN_IDENTITY="" \
  CODE_SIGNING_REQUIRED=NO \
  | tee .log/xcodebuild.log \
  | xcpretty && exit ${PIPESTATUS[0]}
