#### Groups!
You can get an Array with each member of your group doing:

`var my_group_members = get_tree().get_nodes_in_group("my_group")`

You can also call an specific method for all members:

`get_tree().call_group("my_group","my_function",args...)`

If you need to do something with your group:
```
for member in get_tree().get_nodes_in_group("my_group"):
    member.my_function(args...)
```




#### Setup for Android APK export

- Download the commandline SDK from google: https://developer.android.com/studio
- Unpack it to *C:\Android\*
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

#### The magic of **signals***

```
#the magic
# I'm assuming that on "value_changed" is a thing that happens -and a signal can be emitted automagically when something occurs!
sldr_vol.connect("value_changed", self, "VOL_on_value_changed", [s])
```

***

#### Pausing to wait for *something* to complete

Often Godot 'skips' ahead before it completes a function. This a hacky workaround to address that

```
var timer_val = 0.01
yield(get_tree().create_timer(timer_val), "timeout")
```


