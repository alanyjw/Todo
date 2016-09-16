## Deploying Concourse worker on Mac OS X

- Script for launchd to manage our Concourse worker

## Setting up the pipeline

1. Fetch code from git repository
1. Fetch certificate and private key from S3 bucket
1. Add keychain with certificate and private key
1. Build app
1. Run unit tests
1. Run automation tests
1. Remove keychain

#### Add keychain with certificate and private key

Quirks:
- `security create-keychain` does not add the created keychain to its search list
- `security list-keychain` has read and write operations 🙄

#### Build app

Quirks:
- `xcodebuild` is horrible at displaying errors, explaining why it failed (show examples from build history)

## TODO

- [] Verify if it is possible to create user-scoped keychains
- [] Split `xcodebuild build` from `xcodebuild test`
  - [] Specify ARCHIVE_PATH for built app and pass it as output to the next task
- [] Fetch Provisioning Profile from S3 bucket
- [] Remove Provisioning Profile
- [] Pass in Provisioning Profile and Code Signing details as env vars to `xcodebuild`
