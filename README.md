PatientRFID
===========

A quick project implementing one of the NHS Hack Day Cambridge ideas (http://wiki.nhshackday.com/wiki/PatientRFID)

The project consists of two parts: Phonegap mobile application (targeting Android 4+) in "phonegap" folder and LAMP application in "server" folder.

To build the Phonegap application run the following commands while in "phonegap" folder:

* `phonegap local plugin add https://github.com/chariotsolutions/phonegap-nfc.git` - this command dowloads an NFC pluging the project depends on, and you only need to run it once
* `phonegap local build android` - builds an apk file locally. Note that for a local build a standard icon would be used by default, you can replace it manually later in the "platforms' folder this command generates.

Android application *.apk file will appear under phonegap/platforms/android/bin

A compiled version can also be found in server part assets (see below) under assets/bin/NHSHackDay_debug.apk

Setting up the LAMP server part is pretty straightforward, but you will need to download or symlink Zend Framework 1 into application/lib folder. You might also need to update .htaccess file.

License
=======

Please feel free to use this project: http://www.apache.org/licenses/LICENSE-2.0
