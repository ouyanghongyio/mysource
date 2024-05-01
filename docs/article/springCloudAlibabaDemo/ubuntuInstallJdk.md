# ubuntu 安装 Jdk

1、查看服务器架构

```bash
root@ubuntu-server-01:~# uname -m
x86_64
```

2、下载对应架构版本的 jdk

[下载地址](https://www.oracle.com/cn/java/technologies/downloads/)

<rich-text>
  <span style="text-align: center; clear: both; display: block;margin: auto;">
    <img src="https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/image/ubuntuInstallJdk0.png" alt="https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/image/ubuntuInstallJdk0.png" />
  </span>
</rich-text>

3、上传文件到服务器的 /usr/local目录下

4、解压安装包

```bash
cd /usr/local
# 解压文件
tar -zxvf /usr/local/jdk-8u411-linux-x64.tar.gz
```

文件解压 bash

```bash
root@ubuntu-server-01:/usr/local# tar -zxvf /usr/local/jdk-8u411-linux-x64.tar.gz
jdk1.8.0_411/COPYRIGHT
jdk1.8.0_411/LICENSE
jdk1.8.0_411/README.html
jdk1.8.0_411/THIRDPARTYLICENSEREADME-JAVAFX.txt
jdk1.8.0_411/THIRDPARTYLICENSEREADME.txt
jdk1.8.0_411/bin/java-rmi.cgi
jdk1.8.0_411/bin/appletviewer
jdk1.8.0_411/bin/extcheck
jdk1.8.0_411/bin/idlj
jdk1.8.0_411/bin/jar
jdk1.8.0_411/bin/jarsigner
jdk1.8.0_411/bin/javac
jdk1.8.0_411/bin/javadoc
jdk1.8.0_411/bin/javah
jdk1.8.0_411/bin/javap
jdk1.8.0_411/bin/jdeps
jdk1.8.0_411/bin/jdb
jdk1.8.0_411/bin/jconsole
jdk1.8.0_411/bin/jhat
jdk1.8.0_411/bin/jinfo
jdk1.8.0_411/bin/jmap
jdk1.8.0_411/bin/jps
jdk1.8.0_411/bin/jrunscript
jdk1.8.0_411/bin/jjs
jdk1.8.0_411/bin/jsadebugd
jdk1.8.0_411/bin/jstack
jdk1.8.0_411/bin/jstat
jdk1.8.0_411/bin/keytool
jdk1.8.0_411/bin/jstatd
jdk1.8.0_411/bin/native2ascii
jdk1.8.0_411/bin/rmic
jdk1.8.0_411/bin/policytool
jdk1.8.0_411/bin/serialver
jdk1.8.0_411/bin/schemagen
jdk1.8.0_411/bin/xjc
jdk1.8.0_411/bin/wsgen
jdk1.8.0_411/bin/orbd
jdk1.8.0_411/bin/wsimport
jdk1.8.0_411/bin/tnameserv
jdk1.8.0_411/bin/servertool
jdk1.8.0_411/bin/pack200
jdk1.8.0_411/bin/rmid
jdk1.8.0_411/bin/rmiregistry
jdk1.8.0_411/bin/jcmd
jdk1.8.0_411/bin/java
jdk1.8.0_411/bin/unpack200
jdk1.8.0_411/bin/javafxpackager
jdk1.8.0_411/bin/javapackager
jdk1.8.0_411/bin/javaws
jdk1.8.0_411/bin/jcontrol
jdk1.8.0_411/bin/ControlPanel
jdk1.8.0_411/include/jdwpTransport.h
jdk1.8.0_411/include/jni.h
jdk1.8.0_411/include/jvmti.h
jdk1.8.0_411/include/jvmticmlr.h
jdk1.8.0_411/include/classfile_constants.h
jdk1.8.0_411/include/linux/jni_md.h
jdk1.8.0_411/include/linux/jawt_md.h
jdk1.8.0_411/include/jawt.h
jdk1.8.0_411/javafx-src.zip
jdk1.8.0_411/jre/bin/jjs
jdk1.8.0_411/jre/bin/keytool
jdk1.8.0_411/jre/bin/policytool
jdk1.8.0_411/jre/bin/orbd
jdk1.8.0_411/jre/bin/tnameserv
jdk1.8.0_411/jre/bin/pack200
jdk1.8.0_411/jre/bin/servertool
jdk1.8.0_411/jre/bin/rmid
jdk1.8.0_411/jre/bin/rmiregistry
jdk1.8.0_411/jre/bin/java
jdk1.8.0_411/jre/bin/unpack200
jdk1.8.0_411/jre/bin/javaws
jdk1.8.0_411/jre/bin/jcontrol
jdk1.8.0_411/jre/bin/ControlPanel
jdk1.8.0_411/jre/lib/amd64/server/Xusage.txt
jdk1.8.0_411/jre/lib/amd64/server/libjvm.so
jdk1.8.0_411/jre/lib/amd64/server/libjsig.so
jdk1.8.0_411/jre/lib/amd64/libjsig.so
jdk1.8.0_411/jre/lib/amd64/jli/libjli.so
jdk1.8.0_411/jre/lib/amd64/libsaproc.so
jdk1.8.0_411/jre/lib/amd64/jvm.cfg
jdk1.8.0_411/jre/lib/amd64/libverify.so
jdk1.8.0_411/jre/lib/amd64/libnpt.so
jdk1.8.0_411/jre/lib/amd64/libj2pcsc.so
jdk1.8.0_411/jre/lib/amd64/libj2gss.so
jdk1.8.0_411/jre/lib/amd64/libj2pkcs11.so
jdk1.8.0_411/jre/lib/amd64/libbci.so
jdk1.8.0_411/jre/lib/amd64/libjava_crw_demo.so
jdk1.8.0_411/jre/lib/amd64/libhprof.so
jdk1.8.0_411/jre/lib/amd64/libjfr.so
jdk1.8.0_411/jre/lib/amd64/libsunec.so
jdk1.8.0_411/jre/lib/amd64/libsplashscreen.so
jdk1.8.0_411/jre/lib/amd64/libjava.so
jdk1.8.0_411/jre/lib/amd64/libzip.so
jdk1.8.0_411/jre/lib/amd64/libjaas_unix.so
jdk1.8.0_411/jre/lib/amd64/libnet.so
jdk1.8.0_411/jre/lib/amd64/libattach.so
jdk1.8.0_411/jre/lib/amd64/libdt_socket.so
jdk1.8.0_411/jre/lib/amd64/libjsdt.so
jdk1.8.0_411/jre/lib/amd64/libunpack.so
jdk1.8.0_411/jre/lib/amd64/libinstrument.so
jdk1.8.0_411/jre/lib/amd64/libmlib_image.so
jdk1.8.0_411/jre/lib/amd64/libmanagement.so
jdk1.8.0_411/jre/lib/amd64/libjdwp.so
jdk1.8.0_411/jre/lib/amd64/libdcpr.so
jdk1.8.0_411/jre/lib/amd64/libawt.so
jdk1.8.0_411/jre/lib/amd64/libjpeg.so
jdk1.8.0_411/jre/lib/amd64/libjsound.so
jdk1.8.0_411/jre/lib/amd64/libjsoundalsa.so
jdk1.8.0_411/jre/lib/amd64/libresource.so
jdk1.8.0_411/jre/lib/amd64/libnio.so
jdk1.8.0_411/jre/lib/amd64/liblcms.so
jdk1.8.0_411/jre/lib/amd64/libawt_headless.so
jdk1.8.0_411/jre/lib/amd64/libawt_xawt.so
jdk1.8.0_411/jre/lib/amd64/libsctp.so
jdk1.8.0_411/jre/lib/amd64/libjawt.so
jdk1.8.0_411/jre/lib/amd64/libfontmanager.so
jdk1.8.0_411/jre/lib/amd64/libt2k.so
jdk1.8.0_411/jre/lib/amd64/libavplugin-53.so
jdk1.8.0_411/jre/lib/amd64/libavplugin-54.so
jdk1.8.0_411/jre/lib/amd64/libavplugin-55.so
jdk1.8.0_411/jre/lib/amd64/libavplugin-56.so
jdk1.8.0_411/jre/lib/amd64/libavplugin-57.so
jdk1.8.0_411/jre/lib/amd64/libavplugin-ffmpeg-56.so
jdk1.8.0_411/jre/lib/amd64/libavplugin-ffmpeg-57.so
jdk1.8.0_411/jre/lib/amd64/libavplugin-ffmpeg-59.so
jdk1.8.0_411/jre/lib/amd64/libavplugin-ffmpeg-58.so
jdk1.8.0_411/jre/lib/amd64/libavplugin-ffmpeg-60.so
jdk1.8.0_411/jre/lib/amd64/libdecora_sse.so
jdk1.8.0_411/jre/lib/amd64/libfxplugins.so
jdk1.8.0_411/jre/lib/amd64/libglass.so
jdk1.8.0_411/jre/lib/amd64/libglassgtk2.so
jdk1.8.0_411/jre/lib/amd64/libglassgtk3.so
jdk1.8.0_411/jre/lib/amd64/libglib-lite.so
jdk1.8.0_411/jre/lib/amd64/libgstreamer-lite.so
jdk1.8.0_411/jre/lib/amd64/libjavafx_font.so
jdk1.8.0_411/jre/lib/amd64/libjavafx_font_freetype.so
jdk1.8.0_411/jre/lib/amd64/libjavafx_font_pango.so
jdk1.8.0_411/jre/lib/amd64/libjavafx_iio.so
jdk1.8.0_411/jre/lib/amd64/libjfxmedia.so
jdk1.8.0_411/jre/lib/amd64/libjfxwebkit.so
jdk1.8.0_411/jre/lib/amd64/libprism_common.so
jdk1.8.0_411/jre/lib/amd64/libprism_es2.so
jdk1.8.0_411/jre/lib/amd64/libprism_sw.so
jdk1.8.0_411/jre/lib/amd64/libdeploy.so
jdk1.8.0_411/jre/lib/fontconfig.properties.src
jdk1.8.0_411/jre/lib/fontconfig.RedHat.5.properties.src
jdk1.8.0_411/jre/lib/fontconfig.RedHat.6.properties.src
jdk1.8.0_411/jre/lib/fontconfig.Turbo.properties.src
jdk1.8.0_411/jre/lib/fontconfig.SuSE.10.properties.src
jdk1.8.0_411/jre/lib/fontconfig.SuSE.11.properties.src
jdk1.8.0_411/jre/lib/fontconfig.SuSE.10.bfc
jdk1.8.0_411/jre/lib/fontconfig.RedHat.6.bfc
jdk1.8.0_411/jre/lib/fontconfig.bfc
jdk1.8.0_411/jre/lib/fontconfig.Turbo.bfc
jdk1.8.0_411/jre/lib/security/blacklisted.certs
jdk1.8.0_411/jre/lib/security/java.policy
jdk1.8.0_411/jre/lib/security/cacerts
jdk1.8.0_411/jre/lib/security/blacklist
jdk1.8.0_411/jre/lib/security/trusted.libraries
jdk1.8.0_411/jre/lib/security/java.security
jdk1.8.0_411/jre/lib/security/policy/limited/US_export_policy.jar
jdk1.8.0_411/jre/lib/security/policy/limited/local_policy.jar
jdk1.8.0_411/jre/lib/security/policy/unlimited/US_export_policy.jar
jdk1.8.0_411/jre/lib/security/policy/unlimited/local_policy.jar
jdk1.8.0_411/jre/lib/security/public_suffix_list.dat
jdk1.8.0_411/jre/lib/security/javaws.policy
jdk1.8.0_411/jre/lib/fontconfig.RedHat.5.bfc
jdk1.8.0_411/jre/lib/fontconfig.SuSE.11.bfc
jdk1.8.0_411/jre/lib/management/snmp.acl.template
jdk1.8.0_411/jre/lib/management/jmxremote.password.template
jdk1.8.0_411/jre/lib/management/management.properties
jdk1.8.0_411/jre/lib/management/jmxremote.access
jdk1.8.0_411/jre/lib/currency.data
jdk1.8.0_411/jre/lib/tzdb.dat
jdk1.8.0_411/jre/lib/psfont.properties.ja
jdk1.8.0_411/jre/lib/logging.properties
jdk1.8.0_411/jre/lib/psfontj2d.properties
jdk1.8.0_411/jre/lib/flavormap.properties
jdk1.8.0_411/jre/lib/images/cursors/cursors.properties
jdk1.8.0_411/jre/lib/images/cursors/invalid32x32.gif
jdk1.8.0_411/jre/lib/images/cursors/motif_MoveDrop32x32.gif
jdk1.8.0_411/jre/lib/images/cursors/motif_LinkDrop32x32.gif
jdk1.8.0_411/jre/lib/images/cursors/motif_MoveNoDrop32x32.gif
jdk1.8.0_411/jre/lib/images/cursors/motif_CopyDrop32x32.gif
jdk1.8.0_411/jre/lib/images/cursors/motif_LinkNoDrop32x32.gif
jdk1.8.0_411/jre/lib/images/cursors/motif_CopyNoDrop32x32.gif
jdk1.8.0_411/jre/lib/images/icons/sun-java.png
jdk1.8.0_411/jre/lib/images/icons/sun-java_HighContrast.png
jdk1.8.0_411/jre/lib/images/icons/sun-java_HighContrastInverse.png
jdk1.8.0_411/jre/lib/images/icons/sun-java_LowContrast.png
jdk1.8.0_411/jre/lib/content-types.properties
jdk1.8.0_411/jre/lib/cmm/sRGB.pf
jdk1.8.0_411/jre/lib/cmm/LINEAR_RGB.pf
jdk1.8.0_411/jre/lib/cmm/PYCC.pf
jdk1.8.0_411/jre/lib/cmm/GRAY.pf
jdk1.8.0_411/jre/lib/cmm/CIEXYZ.pf
jdk1.8.0_411/jre/lib/calendars.properties
jdk1.8.0_411/jre/lib/hijrah-config-umalqura.properties
jdk1.8.0_411/jre/lib/fonts/LucidaTypewriterRegular.ttf
jdk1.8.0_411/jre/lib/fonts/LucidaTypewriterBold.ttf
jdk1.8.0_411/jre/lib/fonts/LucidaBrightRegular.ttf
jdk1.8.0_411/jre/lib/fonts/LucidaBrightDemiBold.ttf
jdk1.8.0_411/jre/lib/fonts/LucidaBrightDemiItalic.ttf
jdk1.8.0_411/jre/lib/fonts/LucidaBrightItalic.ttf
jdk1.8.0_411/jre/lib/fonts/LucidaSansRegular.ttf
jdk1.8.0_411/jre/lib/fonts/LucidaSansDemiBold.ttf
jdk1.8.0_411/jre/lib/fonts/fonts.dir
jdk1.8.0_411/jre/lib/jvm.hprof.txt
jdk1.8.0_411/jre/lib/oblique-fonts/LucidaTypewriterOblique.ttf
jdk1.8.0_411/jre/lib/oblique-fonts/LucidaTypewriterBoldOblique.ttf
jdk1.8.0_411/jre/lib/oblique-fonts/LucidaSansOblique.ttf
jdk1.8.0_411/jre/lib/oblique-fonts/LucidaSansDemiOblique.ttf
jdk1.8.0_411/jre/lib/oblique-fonts/fonts.dir
jdk1.8.0_411/jre/lib/jfr/default.jfc
jdk1.8.0_411/jre/lib/jfr/profile.jfc
jdk1.8.0_411/jre/lib/sound.properties
jdk1.8.0_411/jre/lib/net.properties
jdk1.8.0_411/jre/lib/ext/nashorn.jar
jdk1.8.0_411/jre/lib/ext/zipfs.jar
jdk1.8.0_411/jre/lib/ext/sunec.jar
jdk1.8.0_411/jre/lib/ext/sunjce_provider.jar
jdk1.8.0_411/jre/lib/ext/sunpkcs11.jar
jdk1.8.0_411/jre/lib/ext/dnsns.jar
jdk1.8.0_411/jre/lib/ext/localedata.jar
jdk1.8.0_411/jre/lib/ext/cldrdata.jar
jdk1.8.0_411/jre/lib/ext/jaccess.jar
jdk1.8.0_411/jre/lib/ext/jfxrt.jar
jdk1.8.0_411/jre/lib/ext/meta-index
jdk1.8.0_411/jre/lib/jexec
jdk1.8.0_411/jre/lib/jce.jar
jdk1.8.0_411/jre/lib/management-agent.jar
jdk1.8.0_411/jre/lib/classlist
jdk1.8.0_411/jre/lib/jfr.jar
jdk1.8.0_411/jre/lib/charsets.jar
jdk1.8.0_411/jre/lib/jsse.jar
jdk1.8.0_411/jre/lib/resources.jar
jdk1.8.0_411/jre/lib/rt.jar
jdk1.8.0_411/jre/lib/javafx.properties
jdk1.8.0_411/jre/lib/jfxswt.jar
jdk1.8.0_411/jre/lib/meta-index
jdk1.8.0_411/jre/lib/deploy.jar
jdk1.8.0_411/jre/lib/deploy/MixedCodeMainDialog.ui
jdk1.8.0_411/jre/lib/deploy/MixedCodeMainDialogJs.ui
jdk1.8.0_411/jre/lib/deploy/cautionshield.icns
jdk1.8.0_411/jre/lib/deploy/java-icon.ico
jdk1.8.0_411/jre/lib/deploy/messages.properties
jdk1.8.0_411/jre/lib/deploy/messages_de.properties
jdk1.8.0_411/jre/lib/deploy/messages_es.properties
jdk1.8.0_411/jre/lib/deploy/messages_fr.properties
jdk1.8.0_411/jre/lib/deploy/messages_it.properties
jdk1.8.0_411/jre/lib/deploy/messages_ja.properties
jdk1.8.0_411/jre/lib/deploy/messages_ko.properties
jdk1.8.0_411/jre/lib/deploy/messages_pt_BR.properties
jdk1.8.0_411/jre/lib/deploy/messages_sv.properties
jdk1.8.0_411/jre/lib/deploy/messages_zh_CN.properties
jdk1.8.0_411/jre/lib/deploy/messages_zh_HK.properties
jdk1.8.0_411/jre/lib/deploy/messages_zh_TW.properties
jdk1.8.0_411/jre/lib/deploy/mixcode_s.png
jdk1.8.0_411/jre/lib/deploy/splash.gif
jdk1.8.0_411/jre/lib/deploy/splash@2x.gif
jdk1.8.0_411/jre/lib/deploy/splash_11-lic.gif
jdk1.8.0_411/jre/lib/deploy/splash_11@2x-lic.gif
jdk1.8.0_411/jre/lib/desktop/applications/sun-java.desktop
jdk1.8.0_411/jre/lib/desktop/applications/sun-javaws.desktop
jdk1.8.0_411/jre/lib/desktop/applications/sun_java.desktop
jdk1.8.0_411/jre/lib/desktop/icons/HighContrast/16x16/apps/sun-java.png
jdk1.8.0_411/jre/lib/desktop/icons/HighContrast/16x16/apps/sun-javaws.png
jdk1.8.0_411/jre/lib/desktop/icons/HighContrast/16x16/apps/sun-jcontrol.png
jdk1.8.0_411/jre/lib/desktop/icons/HighContrast/16x16/mimetypes/gnome-mime-application-x-java-archive.png
jdk1.8.0_411/jre/lib/desktop/icons/HighContrast/16x16/mimetypes/gnome-mime-application-x-java-jnlp-file.png
jdk1.8.0_411/jre/lib/desktop/icons/HighContrast/16x16/mimetypes/gnome-mime-text-x-java.png
jdk1.8.0_411/jre/lib/desktop/icons/HighContrast/48x48/apps/sun-java.png
jdk1.8.0_411/jre/lib/desktop/icons/HighContrast/48x48/apps/sun-javaws.png
jdk1.8.0_411/jre/lib/desktop/icons/HighContrast/48x48/apps/sun-jcontrol.png
jdk1.8.0_411/jre/lib/desktop/icons/HighContrast/48x48/mimetypes/gnome-mime-application-x-java-archive.png
jdk1.8.0_411/jre/lib/desktop/icons/HighContrast/48x48/mimetypes/gnome-mime-application-x-java-jnlp-file.png
jdk1.8.0_411/jre/lib/desktop/icons/HighContrast/48x48/mimetypes/gnome-mime-text-x-java.png
jdk1.8.0_411/jre/lib/desktop/icons/HighContrastInverse/16x16/apps/sun-java.png
jdk1.8.0_411/jre/lib/desktop/icons/HighContrastInverse/16x16/apps/sun-javaws.png
jdk1.8.0_411/jre/lib/desktop/icons/HighContrastInverse/16x16/apps/sun-jcontrol.png
jdk1.8.0_411/jre/lib/desktop/icons/HighContrastInverse/16x16/mimetypes/gnome-mime-application-x-java-archive.png
jdk1.8.0_411/jre/lib/desktop/icons/HighContrastInverse/16x16/mimetypes/gnome-mime-application-x-java-jnlp-file.png
jdk1.8.0_411/jre/lib/desktop/icons/HighContrastInverse/16x16/mimetypes/gnome-mime-text-x-java.png
jdk1.8.0_411/jre/lib/desktop/icons/HighContrastInverse/48x48/apps/sun-java.png
jdk1.8.0_411/jre/lib/desktop/icons/HighContrastInverse/48x48/apps/sun-javaws.png
jdk1.8.0_411/jre/lib/desktop/icons/HighContrastInverse/48x48/apps/sun-jcontrol.png
jdk1.8.0_411/jre/lib/desktop/icons/HighContrastInverse/48x48/mimetypes/gnome-mime-application-x-java-archive.png
jdk1.8.0_411/jre/lib/desktop/icons/HighContrastInverse/48x48/mimetypes/gnome-mime-application-x-java-jnlp-file.png
jdk1.8.0_411/jre/lib/desktop/icons/HighContrastInverse/48x48/mimetypes/gnome-mime-text-x-java.png
jdk1.8.0_411/jre/lib/desktop/icons/LowContrast/16x16/apps/sun-java.png
jdk1.8.0_411/jre/lib/desktop/icons/LowContrast/16x16/apps/sun-javaws.png
jdk1.8.0_411/jre/lib/desktop/icons/LowContrast/16x16/apps/sun-jcontrol.png
jdk1.8.0_411/jre/lib/desktop/icons/LowContrast/16x16/mimetypes/gnome-mime-application-x-java-archive.png
jdk1.8.0_411/jre/lib/desktop/icons/LowContrast/16x16/mimetypes/gnome-mime-application-x-java-jnlp-file.png
jdk1.8.0_411/jre/lib/desktop/icons/LowContrast/16x16/mimetypes/gnome-mime-text-x-java.png
jdk1.8.0_411/jre/lib/desktop/icons/LowContrast/48x48/apps/sun-java.png
jdk1.8.0_411/jre/lib/desktop/icons/LowContrast/48x48/apps/sun-javaws.png
jdk1.8.0_411/jre/lib/desktop/icons/LowContrast/48x48/apps/sun-jcontrol.png
jdk1.8.0_411/jre/lib/desktop/icons/LowContrast/48x48/mimetypes/gnome-mime-application-x-java-archive.png
jdk1.8.0_411/jre/lib/desktop/icons/LowContrast/48x48/mimetypes/gnome-mime-application-x-java-jnlp-file.png
jdk1.8.0_411/jre/lib/desktop/icons/LowContrast/48x48/mimetypes/gnome-mime-text-x-java.png
jdk1.8.0_411/jre/lib/desktop/icons/hicolor/16x16/apps/sun-java.png
jdk1.8.0_411/jre/lib/desktop/icons/hicolor/16x16/apps/sun-javaws.png
jdk1.8.0_411/jre/lib/desktop/icons/hicolor/16x16/apps/sun-jcontrol.png
jdk1.8.0_411/jre/lib/desktop/icons/hicolor/16x16/mimetypes/gnome-mime-application-x-java-archive.png
jdk1.8.0_411/jre/lib/desktop/icons/hicolor/16x16/mimetypes/gnome-mime-application-x-java-jnlp-file.png
jdk1.8.0_411/jre/lib/desktop/icons/hicolor/16x16/mimetypes/gnome-mime-text-x-java.png
jdk1.8.0_411/jre/lib/desktop/icons/hicolor/48x48/apps/sun-java.png
jdk1.8.0_411/jre/lib/desktop/icons/hicolor/48x48/apps/sun-javaws.png
jdk1.8.0_411/jre/lib/desktop/icons/hicolor/48x48/apps/sun-jcontrol.png
jdk1.8.0_411/jre/lib/desktop/icons/hicolor/48x48/mimetypes/gnome-mime-application-x-java-archive.png
jdk1.8.0_411/jre/lib/desktop/icons/hicolor/48x48/mimetypes/gnome-mime-application-x-java-jnlp-file.png
jdk1.8.0_411/jre/lib/desktop/icons/hicolor/48x48/mimetypes/gnome-mime-text-x-java.png
jdk1.8.0_411/jre/lib/desktop/mime/packages/x-java-archive.xml
jdk1.8.0_411/jre/lib/desktop/mime/packages/x-java-jnlp-file.xml
jdk1.8.0_411/jre/lib/javaws.jar
jdk1.8.0_411/jre/lib/locale/de/LC_MESSAGES/sunw_java_plugin.mo
jdk1.8.0_411/jre/lib/locale/es/LC_MESSAGES/sunw_java_plugin.mo
jdk1.8.0_411/jre/lib/locale/fr/LC_MESSAGES/sunw_java_plugin.mo
jdk1.8.0_411/jre/lib/locale/it/LC_MESSAGES/sunw_java_plugin.mo
jdk1.8.0_411/jre/lib/locale/ja/LC_MESSAGES/sunw_java_plugin.mo
jdk1.8.0_411/jre/lib/locale/ko.UTF-8/LC_MESSAGES/sunw_java_plugin.mo
jdk1.8.0_411/jre/lib/locale/ko/LC_MESSAGES/sunw_java_plugin.mo
jdk1.8.0_411/jre/lib/locale/pt_BR/LC_MESSAGES/sunw_java_plugin.mo
jdk1.8.0_411/jre/lib/locale/sv/LC_MESSAGES/sunw_java_plugin.mo
jdk1.8.0_411/jre/lib/locale/zh.GBK/LC_MESSAGES/sunw_java_plugin.mo
jdk1.8.0_411/jre/lib/locale/zh/LC_MESSAGES/sunw_java_plugin.mo
jdk1.8.0_411/jre/lib/locale/zh_HK.BIG5HK/LC_MESSAGES/sunw_java_plugin.mo
jdk1.8.0_411/jre/lib/locale/zh_TW.BIG5/LC_MESSAGES/sunw_java_plugin.mo
jdk1.8.0_411/jre/lib/locale/zh_TW/LC_MESSAGES/sunw_java_plugin.mo
jdk1.8.0_411/jre/lib/plugin.jar
jdk1.8.0_411/jre/COPYRIGHT
jdk1.8.0_411/jre/Welcome.html
jdk1.8.0_411/jre/LICENSE
jdk1.8.0_411/jre/THIRDPARTYLICENSEREADME.txt
jdk1.8.0_411/jre/README
jdk1.8.0_411/jre/legal/jdk/jopt-simple.md
jdk1.8.0_411/jre/legal/jdk/xalan.md
jdk1.8.0_411/jre/legal/jdk/ecc.md
jdk1.8.0_411/jre/legal/jdk/jcup.md
jdk1.8.0_411/jre/legal/jdk/unicode.md
jdk1.8.0_411/jre/legal/jdk/santuario.md
jdk1.8.0_411/jre/legal/jdk/xerces.md
jdk1.8.0_411/jre/legal/jdk/icu.md
jdk1.8.0_411/jre/legal/jdk/lcms.md
jdk1.8.0_411/jre/legal/jdk/zlib.md
jdk1.8.0_411/jre/legal/jdk/joni.md
jdk1.8.0_411/jre/legal/jdk/relaxngom.md
jdk1.8.0_411/jre/legal/jdk/colorimaging.md
jdk1.8.0_411/jre/legal/jdk/pkcs11cryptotoken.md
jdk1.8.0_411/jre/legal/jdk/freebxml.md
jdk1.8.0_411/jre/legal/jdk/asm.md
jdk1.8.0_411/jre/legal/jdk/libpng.md
jdk1.8.0_411/jre/legal/jdk/cryptix.md
jdk1.8.0_411/jre/legal/jdk/bcel.md
jdk1.8.0_411/jre/legal/jdk/dom.md
jdk1.8.0_411/jre/legal/jdk/xmlresolver.md
jdk1.8.0_411/jre/legal/jdk/jpeg.md
jdk1.8.0_411/jre/legal/jdk/relaxngcc.md
jdk1.8.0_411/jre/legal/jdk/mesa3d.md
jdk1.8.0_411/jre/legal/jdk/giflib.md
jdk1.8.0_411/jre/legal/jdk/pkcs11wrapper.md
jdk1.8.0_411/jre/legal/jdk/dynalink.md
jdk1.8.0_411/jre/legal/jdk/thaidict.md
jdk1.8.0_411/jre/legal/jdk/relaxngdatatype.md
jdk1.8.0_411/jre/legal/jdk/cldr.md
jdk1.8.0_411/jre/legal/jdk/pcsclite.md
jdk1.8.0_411/jre/legal/jdk/xwd.md
jdk1.8.0_411/jre/legal/jdk/libxrandr.md
jdk1.8.0_411/jre/legal/jdk/xorgproto.md
jdk1.8.0_411/jre/legal/javafx/directshow.md
jdk1.8.0_411/jre/legal/javafx/glib.md
jdk1.8.0_411/jre/legal/javafx/gstreamer.md
jdk1.8.0_411/jre/legal/javafx/icu_web.md
jdk1.8.0_411/jre/legal/javafx/jpeg_fx.md
jdk1.8.0_411/jre/legal/javafx/libffi.md
jdk1.8.0_411/jre/legal/javafx/libxml2.md
jdk1.8.0_411/jre/legal/javafx/libxslt.md
jdk1.8.0_411/jre/legal/javafx/mesa3d.md
jdk1.8.0_411/jre/legal/javafx/public_suffix.md
jdk1.8.0_411/jre/legal/javafx/webkit.md
jdk1.8.0_411/jre/THIRDPARTYLICENSEREADME-JAVAFX.txt
jdk1.8.0_411/jre/plugin/desktop/sun_java.desktop
jdk1.8.0_411/jre/plugin/desktop/sun_java.png
jdk1.8.0_411/legal/jdk/jopt-simple.md
jdk1.8.0_411/legal/jdk/xalan.md
jdk1.8.0_411/legal/jdk/ecc.md
jdk1.8.0_411/legal/jdk/jcup.md
jdk1.8.0_411/legal/jdk/unicode.md
jdk1.8.0_411/legal/jdk/santuario.md
jdk1.8.0_411/legal/jdk/xerces.md
jdk1.8.0_411/legal/jdk/icu.md
jdk1.8.0_411/legal/jdk/lcms.md
jdk1.8.0_411/legal/jdk/zlib.md
jdk1.8.0_411/legal/jdk/joni.md
jdk1.8.0_411/legal/jdk/relaxngom.md
jdk1.8.0_411/legal/jdk/colorimaging.md
jdk1.8.0_411/legal/jdk/pkcs11cryptotoken.md
jdk1.8.0_411/legal/jdk/freebxml.md
jdk1.8.0_411/legal/jdk/asm.md
jdk1.8.0_411/legal/jdk/libpng.md
jdk1.8.0_411/legal/jdk/cryptix.md
jdk1.8.0_411/legal/jdk/dom.md
jdk1.8.0_411/legal/jdk/bcel.md
jdk1.8.0_411/legal/jdk/xmlresolver.md
jdk1.8.0_411/legal/jdk/jpeg.md
jdk1.8.0_411/legal/jdk/relaxngcc.md
jdk1.8.0_411/legal/jdk/mesa3d.md
jdk1.8.0_411/legal/jdk/giflib.md
jdk1.8.0_411/legal/jdk/pkcs11wrapper.md
jdk1.8.0_411/legal/jdk/dynalink.md
jdk1.8.0_411/legal/jdk/thaidict.md
jdk1.8.0_411/legal/jdk/relaxngdatatype.md
jdk1.8.0_411/legal/jdk/cldr.md
jdk1.8.0_411/legal/jdk/pcsclite.md
jdk1.8.0_411/legal/jdk/xwd.md
jdk1.8.0_411/legal/jdk/xorgproto.md
jdk1.8.0_411/legal/jdk/libxrandr.md
jdk1.8.0_411/legal/javafx/directshow.md
jdk1.8.0_411/legal/javafx/glib.md
jdk1.8.0_411/legal/javafx/gstreamer.md
jdk1.8.0_411/legal/javafx/icu_web.md
jdk1.8.0_411/legal/javafx/jpeg_fx.md
jdk1.8.0_411/legal/javafx/libffi.md
jdk1.8.0_411/legal/javafx/libxml2.md
jdk1.8.0_411/legal/javafx/libxslt.md
jdk1.8.0_411/legal/javafx/mesa3d.md
jdk1.8.0_411/legal/javafx/public_suffix.md
jdk1.8.0_411/legal/javafx/webkit.md
jdk1.8.0_411/lib/amd64/jli/libjli.so
jdk1.8.0_411/lib/amd64/libjawt.so
jdk1.8.0_411/lib/orb.idl
jdk1.8.0_411/lib/ir.idl
jdk1.8.0_411/lib/jexec
jdk1.8.0_411/lib/jconsole.jar
jdk1.8.0_411/lib/sa-jdi.jar
jdk1.8.0_411/lib/dt.jar
jdk1.8.0_411/lib/tools.jar
jdk1.8.0_411/lib/ct.sym
jdk1.8.0_411/lib/ant-javafx.jar
jdk1.8.0_411/lib/javafx-mx.jar
jdk1.8.0_411/lib/packager.jar
jdk1.8.0_411/man/man1/java.1
jdk1.8.0_411/man/man1/jjs.1
jdk1.8.0_411/man/man1/keytool.1
jdk1.8.0_411/man/man1/orbd.1
jdk1.8.0_411/man/man1/pack200.1
jdk1.8.0_411/man/man1/policytool.1
jdk1.8.0_411/man/man1/rmid.1
jdk1.8.0_411/man/man1/rmiregistry.1
jdk1.8.0_411/man/man1/tnameserv.1
jdk1.8.0_411/man/man1/servertool.1
jdk1.8.0_411/man/man1/unpack200.1
jdk1.8.0_411/man/man1/javaws.1
jdk1.8.0_411/man/man1/appletviewer.1
jdk1.8.0_411/man/man1/extcheck.1
jdk1.8.0_411/man/man1/idlj.1
jdk1.8.0_411/man/man1/jar.1
jdk1.8.0_411/man/man1/jarsigner.1
jdk1.8.0_411/man/man1/javac.1
jdk1.8.0_411/man/man1/javadoc.1
jdk1.8.0_411/man/man1/javah.1
jdk1.8.0_411/man/man1/javap.1
jdk1.8.0_411/man/man1/jconsole.1
jdk1.8.0_411/man/man1/jcmd.1
jdk1.8.0_411/man/man1/jdb.1
jdk1.8.0_411/man/man1/jdeps.1
jdk1.8.0_411/man/man1/jhat.1
jdk1.8.0_411/man/man1/jinfo.1
jdk1.8.0_411/man/man1/jmap.1
jdk1.8.0_411/man/man1/jps.1
jdk1.8.0_411/man/man1/jrunscript.1
jdk1.8.0_411/man/man1/jsadebugd.1
jdk1.8.0_411/man/man1/jstack.1
jdk1.8.0_411/man/man1/jstat.1
jdk1.8.0_411/man/man1/native2ascii.1
jdk1.8.0_411/man/man1/jstatd.1
jdk1.8.0_411/man/man1/rmic.1
jdk1.8.0_411/man/man1/schemagen.1
jdk1.8.0_411/man/man1/serialver.1
jdk1.8.0_411/man/man1/wsgen.1
jdk1.8.0_411/man/man1/wsimport.1
jdk1.8.0_411/man/man1/xjc.1
jdk1.8.0_411/man/man1/javapackager.1
jdk1.8.0_411/man/man1/javafxpackager.1
jdk1.8.0_411/man/ja_JP.UTF-8/man1/java.1
jdk1.8.0_411/man/ja_JP.UTF-8/man1/keytool.1
jdk1.8.0_411/man/ja_JP.UTF-8/man1/jjs.1
jdk1.8.0_411/man/ja_JP.UTF-8/man1/orbd.1
jdk1.8.0_411/man/ja_JP.UTF-8/man1/pack200.1
jdk1.8.0_411/man/ja_JP.UTF-8/man1/policytool.1
jdk1.8.0_411/man/ja_JP.UTF-8/man1/rmid.1
jdk1.8.0_411/man/ja_JP.UTF-8/man1/rmiregistry.1
jdk1.8.0_411/man/ja_JP.UTF-8/man1/servertool.1
jdk1.8.0_411/man/ja_JP.UTF-8/man1/tnameserv.1
jdk1.8.0_411/man/ja_JP.UTF-8/man1/unpack200.1
jdk1.8.0_411/man/ja_JP.UTF-8/man1/javaws.1
jdk1.8.0_411/man/ja_JP.UTF-8/man1/appletviewer.1
jdk1.8.0_411/man/ja_JP.UTF-8/man1/extcheck.1
jdk1.8.0_411/man/ja_JP.UTF-8/man1/idlj.1
jdk1.8.0_411/man/ja_JP.UTF-8/man1/jar.1
jdk1.8.0_411/man/ja_JP.UTF-8/man1/jarsigner.1
jdk1.8.0_411/man/ja_JP.UTF-8/man1/javac.1
jdk1.8.0_411/man/ja_JP.UTF-8/man1/javadoc.1
jdk1.8.0_411/man/ja_JP.UTF-8/man1/javah.1
jdk1.8.0_411/man/ja_JP.UTF-8/man1/javap.1
jdk1.8.0_411/man/ja_JP.UTF-8/man1/jconsole.1
jdk1.8.0_411/man/ja_JP.UTF-8/man1/jcmd.1
jdk1.8.0_411/man/ja_JP.UTF-8/man1/jdb.1
jdk1.8.0_411/man/ja_JP.UTF-8/man1/jdeps.1
jdk1.8.0_411/man/ja_JP.UTF-8/man1/jhat.1
jdk1.8.0_411/man/ja_JP.UTF-8/man1/jinfo.1
jdk1.8.0_411/man/ja_JP.UTF-8/man1/jmap.1
jdk1.8.0_411/man/ja_JP.UTF-8/man1/jps.1
jdk1.8.0_411/man/ja_JP.UTF-8/man1/jrunscript.1
jdk1.8.0_411/man/ja_JP.UTF-8/man1/jsadebugd.1
jdk1.8.0_411/man/ja_JP.UTF-8/man1/jstack.1
jdk1.8.0_411/man/ja_JP.UTF-8/man1/jstat.1
jdk1.8.0_411/man/ja_JP.UTF-8/man1/native2ascii.1
jdk1.8.0_411/man/ja_JP.UTF-8/man1/jstatd.1
jdk1.8.0_411/man/ja_JP.UTF-8/man1/rmic.1
jdk1.8.0_411/man/ja_JP.UTF-8/man1/schemagen.1
jdk1.8.0_411/man/ja_JP.UTF-8/man1/wsgen.1
jdk1.8.0_411/man/ja_JP.UTF-8/man1/serialver.1
jdk1.8.0_411/man/ja_JP.UTF-8/man1/wsimport.1
jdk1.8.0_411/man/ja_JP.UTF-8/man1/xjc.1
jdk1.8.0_411/man/ja_JP.UTF-8/man1/javapackager.1
jdk1.8.0_411/man/ja_JP.UTF-8/man1/javafxpackager.1
jdk1.8.0_411/man/ja
jdk1.8.0_411/release
jdk1.8.0_411/src.zip
jdk1.8.0_411/jvisualvm.txt
jdk1.8.0_411/jmc.txt
jdk1.8.0_411/jre/lib/applet/
```

5、更改解压后的文件夹名称

```bash
mv /usr/local/jdk1.8.0_411 /usr/local/java
```

6、配置环境变量

```bash
vim /etc/profile
```

文件最后添加如下内容

```bash
export JAVA_HOME=/usr/local/java
export PATH=$PATH:$JAVA_HOME/bin
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export JRE_HOME=$JAVA_HOME/jre
```

最后文件内容bash 如下

```bash
if [ "${PS1-}" ]; then
  if [ "${BASH-}" ] && [ "$BASH" != "/bin/sh" ]; then
    # The file bash.bashrc already sets the default PS1.
    # PS1='\h:\w\$ '
    if [ -f /etc/bash.bashrc ]; then
      . /etc/bash.bashrc
    fi
  else
    if [ "$(id -u)" -eq 0 ]; then
      PS1='# '
    else
      PS1='$ '
    fi
  fi
fi

if [ -d /etc/profile.d ]; then
  for i in /etc/profile.d/*.sh; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
fi

export JAVA_HOME=/usr/local/java
export PATH=$PATH:$JAVA_HOME/bin
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export JRE_HOME=$JAVA_HOME/jre
"/etc/profile" 32L, 746B                                                                                                    32,30         Bot
```

7、生效配置文件

```bash
source /etc/profile
```

8、查看java版本，如下即为成功

```bash
root@ubuntu-server-01:/usr/local# java -version
java version "1.8.0_411"
Java(TM) SE Runtime Environment (build 1.8.0_411-b09)
Java HotSpot(TM) 64-Bit Server VM (build 25.411-b09, mixed mode)
```