#!/bin/sh

DEVICE=rhodium

ANDROID_ROOT=../../..

GAPPSZIP=gapps-ics-20120429-signed.zip
GAPPSMIRROR="http://goo-inside.me/gapps/"

DESTDIR=vendor/htc/$DEVICE/proprietary

if [ "$1" = "-g" ]
then
	wget --tries=5 -O "${ANDROID_ROOT}"/$GAPPSZIP $GAPPSMIRROR/$GAPPSZIP
	if [ $? != 0 ]
	then
		echo "Error downloading Google apps package $GAPPSMIRROR/$GAPPSZIP. Exiting." >/dev/stderr
		exit 1
	fi
fi

# Extract Google apps
[ -f "${ANDROID_ROOT}"/$GAPPSZIP ] && unzip -j -o "${ANDROID_ROOT}"/$GAPPSZIP 'system/*' -d "${ANDROID_ROOT}"/$DESTDIR

if [ -f "${ANDROID_ROOT}"/$GAPPSZIP ]
then
	(cat << EOF) | sed s:__DESTDIR__:$DESTDIR:g >> ../../../vendor/htc/$DEVICE/device_$DEVICE-vendor-blobs.mk
PRODUCT_COPY_FILES += \\
    __DESTDIR__/ChromeBookmarksSyncAdapter.apk:system/app/ChromeBookmarksSyncAdapter.apk \\
    __DESTDIR__/GalleryGoogle.apk:system/app/GalleryGoogle.apk \\
    __DESTDIR__/GenieWidget.apk:system/app/GenieWidget.apk \\
    __DESTDIR__/GoogleBackupTransport.apk:system/app/GoogleBackupTransport.apk \\
    __DESTDIR__/GoogleCalendarSyncAdapter.apk:system/app/GoogleCalendarSyncAdapter.apk \\
    __DESTDIR__/GoogleContactsSyncAdapter.apk:system/app/GoogleContactsSyncAdapter.apk \\
    __DESTDIR__/GoogleFeedback.apk:system/app/GoogleFeedback.apk \\
    __DESTDIR__/GoogleLoginService.apk:system/app/GoogleLoginService.apk \\
    __DESTDIR__/GooglePartnerSetup.apk:system/app/GooglePartnerSetup.apk \\
    __DESTDIR__/GoogleQuickSearchBox.apk:system/app/GoogleQuickSearchBox.apk \\
    __DESTDIR__/GoogleServicesFramework.apk:system/app/GoogleServicesFramework.apk \\
    __DESTDIR__/GoogleTTS.apk:system/app/GoogleTTS.apk \\
    __DESTDIR__/MarketUpdater.apk:system/app/MarketUpdater.apk \\
    __DESTDIR__/MediaUploader.apk:system/app/MediaUploader.apk \\
    __DESTDIR__/NetworkLocation.apk:system/app/NetworkLocation.apk \\
    __DESTDIR__/OneTimeInitializer.apk:system/app/OneTimeInitializer.apk \\
    __DESTDIR__/Phonesky.apk:system/app/Phonesky.apk \\
    __DESTDIR__/SetupWizard.apk:system/app/SetupWizard.apk \\
    __DESTDIR__/Talk.apk:system/app/Talk.apk \\
    __DESTDIR__/VoiceSearch.apk:system/app/VoiecSearch.apk \\
    __DESTDIR__/com.google.android.maps.xml:system/etc/permissions/com.google.android.maps.xml \\
    __DESTDIR__/features.xml:system/etc/permissions/features.xml \\
    __DESTDIR__/g.prop:system/etc/g.prop \\
    __DESTDIR__/com.google.android.maps.jar:system/framework/com.google.android.maps.jar \\
    __DESTDIR__/libvoicesearch.so:system/lib/libvoicesearch.so
EOF
fi

#./setup-makefiles.sh
