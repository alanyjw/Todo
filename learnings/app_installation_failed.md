- Taken from: https://ci.pivotal-sg.com/teams/main/pipelines/todo-ios/jobs/tests/builds/163
```
writeDictToFile:1269 open failed for /var/folders/tc/ysdbszh51fl50nk7ql89k7t00000gn/C/com.apple.DeveloperTools/All/Xcode/EmbeddedAppDeltas/b4662272b65b091ba24248f50a1e98c1/eec4222e1b03d82a692d11b56ea965c18df624aa/ManifestCache.plist : No such file or directory
MDMCacheDirectoryManifest:1364 writeDictToFile failed to write to /var/folders/tc/ysdbszh51fl50nk7ql89k7t00000gn/C/com.apple.DeveloperTools/All/Xcode/EmbeddedAppDeltas/b4662272b65b091ba24248f50a1e98c1/eec4222e1b03d82a692d11b56ea965c18df624aa/ManifestCache.plist : No such file or directory
2016-10-04 15:50:31.092 xcodebuild[8355:54302] Error Domain=com.apple.dtdevicekit Code=-402653179 "App installation failed" UserInfo={NSLocalizedFailureReason=Could not write to the device., com.apple.dtdevicekit.stacktrace=(
	0   DTDeviceKitBase                     0x00000001097aa3cb DTDKCreateNSError + 113
	1   DTDeviceKitBase                     0x00000001097aab09 DTDK_AMDErrorToNSError + 791
	2   DTDeviceKitBase                     0x00000001097eaa02 __90-[DTDKRemoteDeviceToken installApplicationBundleAtPath:withOptions:andError:withCallback:]_block_invoke + 158
	3   DVTFoundation                       0x0000000100d072e5 DVTInvokeWithStrongOwnership + 75
	4   DTDeviceKitBase                     0x00000001097ea748 -[DTDKRemoteDeviceToken installApplicationBundleAtPath:withOptions:andError:withCallback:] + 1181
	5   IDEiOSSupportCore                   0x00000001096e336a __118-[DVTiOSDevice(DVTiPhoneApplicationInstallation) processAppInstallSet:appUninstallSet:installOptions:completionBlock:]_block_invoke.336 + 4597
	6   DVTFoundation                       0x0000000100e2af4b __DVTDispatchAsync_block_invoke + 827
	7   libdispatch.dylib                   0x00007fff9cfc793d _dispatch_call_block_and_release + 12
	8   libdispatch.dylib                   0x00007fff9cfbc40b _dispatch_client_callout + 8
	9   libdispatch.dylib                   0x00007fff9cfc103b _dispatch_queue_drain + 754
	10  libdispatch.dylib                   0x00007fff9cfc7707 _dispatch_queue_invoke + 549
	11  libdispatch.dylib                   0x00007fff9cfbfd53 _dispatch_root_queue_drain + 538
	12  libdispatch.dylib                   0x00007fff9cfbfb00 _dispatch_worker_thread3 + 91
	13  libsystem_pthread.dylib             0x00007fff92ed84de _pthread_wqthread + 1129
	14  libsystem_pthread.dylib             0x00007fff92ed6341 start_wqthread + 13
), NSLocalizedRecoverySuggestion=Could not write to the device., NSLocalizedDescription=App installation failed}
2016-10-04 15:50:31.092 xcodebuild[8355:54302] Error Domain=IDETestOperationsObserverErrorDomain Code=5 "Early unexpected exit, operation never finished bootstrapping - no restart will be attempted" UserInfo={NSLocalizedDescription=Early unexpected exit, operation never finished bootstrapping - no restart will be attempted}

Testing failed:
	Test target TodoTests encountered an error (Early unexpected exit, operation never finished bootstrapping - no restart will be attempted)
** TEST FAILED **
```
