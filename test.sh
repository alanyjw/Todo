#! /bin/bash

CURR_DIR=$(pwd)
SCHEME="Todo"
PROJECT="$CURR_DIR/Todo.xcodeproj"
TEST_SDK="iphonesimulator9.3"

mkdir -p "$CURR_DIR/.log"

xcodebuild \
  -scheme $SCHEME \
  -project $PROJECT \
  -destination 'platform=iOS Simulator,name=iPhone 6s,OS=9.3' \
  -sdk $TEST_SDK \
  clean build test \
  CODE_SIGN_IDENTITY="" \
  CODE_SIGNING_REQUIRED=NO \
  | tee "$CURR_DIR/.log/xcodebuild.log" \
  | xcpretty && exit ${PIPESTATUS[0]}
