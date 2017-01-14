# QtIosCrashlytics
iOS native Crashlytics Integration with Qt project

In order to run it on the device:

1. Install Crashlytics from pods: ```cd to ios/libs/CocoaPods``` and run ```pod install```
2. Set up Crashlytics: in app's .plist file (ios/deploy/Info.plist) set correct ```Fabric``` ```APIKey```
3. Set up iOS app: in iosDelegateExample.pro set
  * provisioning profile (```QMAKE_XCODE_PROVISIONING_PROFILE```),
  * development team (```Q_DEVELOPMENT_TEAM.value```),
  * app bundle name (```Q_PRODUCT_BUNDLE_IDENTIFIER.value```);
4. Connect any iOS (9.0+, but can be changed in .pro file) device and run!

# Important notice

Qt in order to make iOS builds faster does not generate corresponding ```.dSYM``` files. To enable it add

```QMAKE_XCODE_DEBUG_INFORMATION_FORMAT = dwarf-with-dsym```

```Q_GENERATE_DEBUGGING_SYMBOLS.name = GCC_GENERATE_DEBUGGING_SYMBOLS```
```Q_GENERATE_DEBUGGING_SYMBOLS.value = YES```
```QMAKE_MAC_XCODE_SETTINGS += Q_GENERATE_DEBUGGING_SYMBOLS```

to .pro file - but remember it will take some time to create it (especially for a debug build). What's more, after ```.dSYM``` file is created it should be uploaded to Crashlytics. On iOS it it done automatically from Xcode script which is run after a build is completed. I didn't figure out how to add such script to .xcodeproj from qmake / .pro, so just run ```ios/libs/CocoaPods/Pods/Fabric/upload-symbols -a <Fabric APIKey> -p ios <path/to/build/folder/with/app.dSYM>``` after build is completed.
