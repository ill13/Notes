*** MIUI Debloat List

This is my list of things to disable on my Poco NFC X3 running 12.5.?

I have not de-duped nor have I really checked if anything important is disabled so **use at your own risk**

The last bit that starts with the ```pm enable --user 0``` are APKs that  I found out I needed/wanted *after* I disabled them.

To use:
- Connect to your phone via ADB however you'd like. Like ```./adb devices```
- Run ```./adb shell```
- Copy and paste everything below **Debloat as of 19-dec-2021**
- Use the example below to add/remove your own items

Example showing how disabling/enabling an APK

```bash
pm disable-user --user 0 com.amazon.appmanager
pm enable --user 0 com.amazon.appmanager
```

*** Debloat as of 19-dec-2021


pm disable-user --user 0 com.android.providers.downloads.ui
pm disable-user --user 0 com.android.soundrecorder
pm disable-user --user 0 com.google.android.apps.wellbeing
pm disable-user --user 0 com.mi.android.globalFileexplorer
pm disable-user --user 0 com.mi.android.globalminusscreen
pm disable-user --user 0 com.mi.globalbrowser
pm disable-user --user 0 com.mi.globallayout
pm disable-user --user 0 com.mipay.wallet.in
pm disable-user --user 0 com.miui.analytics
pm disable-user --user 0 com.miui.android.fashiongallery
pm disable-user --user 0 com.miui.audioeffect
pm disable-user --user 0 com.miui.audiomonitor
pm disable-user --user 0 com.miui.backup
pm disable-user --user 0 com.miui.bugreport
pm disable-user --user 0 com.miui.cleanmaster
pm disable-user --user 0 com.miui.cloudbackup
pm disable-user --user 0 com.miui.cloudservice
pm disable-user --user 0 com.miui.cloudservice.sysbase
pm disable-user --user 0 com.miui.daemon
pm disable-user --user 0 com.miui.fm
pm disable-user --user 0 com.miui.fmservice
pm disable-user --user 0 com.miui.freeform
pm disable-user --user 0 com.miui.gallery
pm disable-user --user 0 com.miui.global.packageinstaller
pm disable-user --user 0 com.miui.hybrid
pm disable-user --user 0 com.miui.hybrid.accessory
pm disable-user --user 0 com.miui.micloudsync
pm disable-user --user 0 com.miui.miservice
pm disable-user --user 0 com.miui.mishare.connectivity
pm disable-user --user 0 com.miui.misound
pm disable-user --user 0 com.miui.msa.global
pm disable-user --user 0 com.miui.notes
pm disable-user --user 0 com.miui.phrase
pm disable-user --user 0 com.miui.player
pm disable-user --user 0 com.miui.powerkeeper
pm disable-user --user 0 com.miui.touchassistant
pm disable-user --user 0 com.miui.videoplayer
pm disable-user --user 0 com.miui.vsimcore
pm disable-user --user 0 com.miui.yellowpage
pm disable-user --user 0 com.tencent.soter.soterserver
pm disable-user --user 0 com.xiaomi.discover
pm disable-user --user 0 com.xiaomi.joyose
pm disable-user --user 0 com.xiaomi.micloud.sdk
pm disable-user --user 0 com.xiaomi.midrop
pm disable-user --user 0 com.xiaomi.miplay_client
pm disable-user --user 0 com.xiaomi.misettings
pm disable-user --user 0 com.xiaomi.payment
pm disable-user --user 0 com.xiaomi.powerchecker
pm disable-user --user 0 com.xiaomi.scanner
pm disable-user --user 0 com.xiaomi.simactivate.service
pm disable-user --user 0 com.xiaomi.xmsf
pm disable-user --user 0 com.xiaomi.xmsfkeeper
pm disable-user --user 0 com.facebook.system
pm disable-user --user 0 com.facebook.appmanager
pm disable-user --user 0 com.facebook.services
pm disable-user --user 0 com.xiaomi.mipicks
pm disable-user --user 0 com.miui.translation.kingsoft
pm disable-user --user 0 com.miui.translation.youdao
pm disable-user --user 0 com.miui.translation.xmcloud
pm disable-user --user 0 com.miui.translationservice
pm disable-user --user 0 com.micredit.in
pm disable-user --user 0 com.mi.health
pm disable-user --user 0 com.miui.yellowpage
pm disable-user --user 0 com.mipay.wallet.id
pm disable-user --user 0 com.mipay.wallet.in
pm disable-user --user 0 com.miui.cleanmaster
pm disable-user --user 0 com.miui.daemon
pm disable-user --user 0 com.miui.msa.global
pm disable-user --user 0 com.xiaomi.joyose
pm disable-user --user 0 com.facebook.system
pm disable-user --user 0 com.facebook.appmanager
pm disable-user --user 0 com.facebook.services
pm disable-user --user 0 com.miui.analytics
pm disable-user --user 0 com.xiaomi.midrop
pm disable-user --user 0 com.android.browser
pm disable-user --user 0 com.android.calendar
pm disable-user --user 0 com.miui.bugreport
pm disable-user --user 0 com.xiaomi.glgm
pm disable-user --user 0 com.miui.weather2
pm disable-user --user 0 com.miui.miservice
pm disable-user --user 0 com.miui.player
pm disable-user --user 0 com.miui.hybrid
pm disable-user --user 0 com.miui.hybrid.accessory
pm disable-user --user 0 com.xiaomi.mipicks
pm disable-user --user 0 com.miui.translation.kingsoft
pm disable-user --user 0 com.miui.translation.youdao
pm disable-user --user 0 com.miui.translation.xmcloud
pm disable-user --user 0 com.miui.translationservice
pm disable-user --user 0 com.xiaomi.mirecycle
pm disable-user --user 0 com.miui.global.packageinstaller
pm disable-user --user 0 com.mi.android.globalminusscreen
pm disable-user --user 0 com.micredit.in
pm disable-user --user 0 com.mi.health
pm disable-user --user 0 com.mi.android.globalFileexplorer
pm disable-user --user 0 android.autoinstalls.config.Xiaomi.ginkgo
pm disable-user --user 0 cn.wps.xiaomi.abroad.lite
pm disable-user --user 0 android.autoinstalls.config.Xiaomi.ginkgo
pm disable-user --user 0 com.miui.cleanmaster
pm disable-user --user 0 com.miui.daemon
pm disable-user --user 0 com.miui.msa.global
pm disable-user --user 0 com.xiaomi.joyose
pm disable-user --user 0 com.facebook.system
pm disable-user --user 0 com.miui.analytics
pm disable-user --user 0 com.xiaomi.midrop
pm disable-user --user 0 com.android.browser
pm disable-user --user 0 com.android.calendar
pm disable-user --user 0 com.miui.bugreport
pm disable-user --user 0 com.xiaomi.glgm
pm disable-user --user 0 com.miui.weather2
pm disable-user --user 0 com.miui.miservice
pm disable-user --user 0 com.miui.player
pm disable-user --user 0 com.miui.hybrid
pm disable-user --user 0 com.miui.hybrid.accessory
pm disable-user --user 0 com.xiaomi.mipicks
pm disable-user --user 0 com.miui.translation.kingsoft
pm disable-user --user 0 com.miui.translation.youdao
pm disable-user --user 0 com.miui.translation.xmcloud
pm disable-user --user 0 com.miui.translationservice
pm disable-user --user 0 com.xiaomi.mirecycle
pm disable-user --user 0 com.miui.global.packageinstaller
pm disable-user --user 0 com.mi.android.globalminusscreen
pm disable-user --user 0 com.micredit.in
pm disable-user --user 0 com.mi.health
pm disable-user --user 0 com.mi.android.globalFileexplorer
pm disable-user --user 0 android.autoinstalls.config.Xiaomi.ginkgo
pm disable-user --user 0 cn.wps.xiaomi.abroad.lite
pm disable-user --user 0 android.autoinstalls.config.Xiaomi.ginkgo
pm disable-user --user 0 com.facebook.appmanager
pm disable-user --user 0 com.facebook.services
pm disable-user --user 0 com.google.android.music
pm disable-user --user 0 com.google.android.videos
pm disable-user --user 0 com.mipay.wallet.id
pm disable-user --user 0 com.mipay.wallet.in
pm disable-user --user 0 com.miui.cleanmaster
pm disable-user --user 0 com.miui.msa.global
pm disable-user --user 0 com.miui.player
pm disable-user --user 0 com.miui.videoplayer
pm disable-user --user 0 com.miui.yellowpage
pm disable-user --user 0 com.xiaomi.joyose
pm disable-user --user 0 com.xiaomi.payment 
pm disable-user --user 0 com.android.deskclock 
pm disable-user --user 0 com.mi.android.globalminusscreen 
pm disable-user --user 0 com.mi.android.globalFileexplorer
pm disable-user --user 0 com.mi.globalbrowser 
pm disable-user --user 0 com.mipay.wallet.in 
pm disable-user --user 0 com.miui.analytics 
pm disable-user --user 0 com.miui.backup 
pm disable-user --user 0 com.miui.bugreport 
pm disable-user --user 0 com.miui.cleanmaster 
pm disable-user --user 0 com.miui.cloudbackup 
pm disable-user --user 0 com.miui.cloudservice 
pm disable-user --user 0 com.miui.micloudsync 
pm disable-user --user 0 com.miui.cloudservice.sysbase 
pm disable-user --user 0 com.miui.fm 
pm disable-user --user 0 com.miui.freeform 
pm disable-user --user 0 com.miui.hybrid 
pm disable-user --user 0 com.miui.hybrid.accessory 
pm disable-user --user 0 com.miui.miservice 
pm disable-user --user 0 com.miui.mishare.connectivity 
pm disable-user --user 0 com.miui.miwallpaper 
pm disable-user --user 0 com.miui.msa.global 
pm disable-user --user 0 com.miui.notes 
pm disable-user --user 0 com.miui.phrase 
pm disable-user --user 0 com.miui.player 
pm disable-user --user 0 com.miui.screenrecorder 
pm disable-user --user 0 com.miui.touchassistant 
pm disable-user --user 0 com.miui.videoplayer 
pm disable-user --user 0 com.miui.weather2 
pm disable-user --user 0 com.miui.yellowpage 
pm disable-user --user 0 com.xiaomi.account 
pm disable-user --user 0 com.xiaomi.calendar 
pm disable-user --user 0 com.xiaomi.discover 
pm disable-user --user 0 com.xiaomi.glgm 
pm disable-user --user 0 com.xiaomi.joyose 
pm disable-user --user 0 com.xiaomi.midrop 
pm disable-user --user 0 com.xiaomi.mipicks 
pm disable-user --user 0 com.xiaomi.miplay_client
pm disable-user --user 0 com.xiaomi.mircs 
pm disable-user --user 0 com.xiaomi.mirecycle 
pm disable-user --user 0 com.xiaomi.misettings 
pm disable-user --user 0 com.xiaomi.payment 
pm disable-user --user 0 com.xiaomi.scanner 
pm disable-user --user 0 com.xiaomi.xmsf 
pm disable-user --user 0 com.xiaomi.xmsfkeeper 
pm disable-user --user 0 com.netflix.partner.activation 
pm disable-user --user 0 com.netflix.mediaclient 
pm disable-user --user 0 com.tencent.soter.soterserver 
pm disable-user --user 0 com.facebook.appmanager 
pm disable-user --user 0 com.facebook.services 
pm disable-user --user 0 com.facebook.system 
pm disable-user --user 0 com.facebook.katana 
pm disable-user --user 0 com.agoda.mobile.consumer
pm disable-user --user 0 com.amazon.mShop.android.shopping
pm disable-user --user 0 com.miui.cloudbackup
pm disable-user --user 0 com.ebay.mobile
pm disable-user --user 0 com.ebay.carrier
pm disable-user --user 0 com.linkedin.android
pm disable-user --user 0 pl.zdunex25.updater
pm disable-user --user 0 com.mi.global.pocobbs
pm disable-user --user 0 com.zhiliaoapp.musically
pm disable-user --user 0 com.miplay_client
pm disable-user --user 0 com.amazon.appmanager





pm enable --user 0 com.android.providers.downloads.ui
pm enable --user 0 com.android.soundrecorder
pm enable --user 0 com.android.browser
pm enable --user 0 com.android.calendar
pm enable --user 0 com.android.chrome 
pm enable --user 0 com.android.deskclock 
pm enable --user 0 com.android.soundrecorder
pm enable --user 0 com.google.android.apps.wellbeing
pm enable --user 0 com.google.android.youtube
pm enable --user 0 com.miui.calculator 
pm enable --user 0 com.miui.videoplayer
pm enable --user 0 com.google.android.apps.docs
pm enable --user 0 com.google.android.apps.photos
pm enable --user 0 com.google.android.apps.tachyon
pm enable --user 0 com.google.android.gm
pm enable --user 0 com.google.android.googlequicksearchbox
pm enable --user 0 com.google.android.youtube
pm enable --user 0 com.android.browser
pm enable --user 0 com.xiaomi.account
pm enable --user 0 com.miplay_client
pm enable --user 0 com.xiaomi.misettings
pm enable --user 0 com.xiaomi.scanner
pm enable --user 0 com.miui.miwallpaper
pm enable --user 0 com.miui.android.fashiongallery
pm enable --user 0 com.miui.weather2
pm enable --user 0 com.mi.android.globallauncher
