#! /bin/bash

SCHEME="Todo"
PROJECT="Todo.xcodeproj"
TEST_SDK="iphonesimulator9.3"

xcodebuild -scheme $SCHEME -project $PROJECT -destination 'platform=iOS Simulator,name=iPhone 6s,OS=9.3' -sdk $TEST_SDK clean build test CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO | xcpretty
