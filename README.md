PatientRFID
===========

A quick project implementing one of the NHS Hack Day Cambridge ideas (http://wiki.nhshackday.com/wiki/PatientRFID)

Setup
=====

The project consists of two parts: Phonegap mobile application (targeting Android 4+) in "phonegap" folder and Python Flask application in "server" folder.

To build the Phonegap application run the following commands while in "phonegap" folder:

* `phonegap local plugin add https://github.com/chariotsolutions/phonegap-nfc.git` - only run it once
* `phonegap local build android`

Android application *.apk file will appear under phonegap/platforms/android/bin

Instructions on deploying Flask applications to WebFaction: http://flask.pocoo.org/snippets/65

License
=======

Please feel free to use this project: http://www.apache.org/licenses/LICENSE-2.0


