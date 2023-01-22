#### Setup for Android APK export

https://developer.android.com/studio

- Download the commandline SDK from google
- Unpack it to C:\Android\
- Run this:
```
./sdkmanager --sdk_root=C:\Android\cmdline-tools "platform-tools" "build-tools;30.0.3" "platforms;android-31" "cmdline-tools;latest" "cmake;3.10.2.4988404" "ndk;21.4.7075529"
```
- From somewhere in the cmdline-tools folder [maybe the *bin* folder], run the following:
```
keytool -keyalg RSA -genkeypair -alias androiddebugkey -keypass android -keystore debug.keystore -storepass android -dname "CN=Android Debug,O=Android,C=US" -validity 9999 -deststoretype pkcs12
```

- Set these paths in Godot

```
C:\Android\cmdline-tools\platform-tools
C:/Users/[username]/.android/debug.keystore
```

***
