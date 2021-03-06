
# replace with your own IDs 

# GENERIC
export APP_NAME=CapptainCordova
export PACKAGE_NAME=com.del7a.capptaincordova
export CAPPTAIN_REDIRECT_URL=mytest
export CAPPTAIN_ENABLE_LOG=true

# IOS
export CAPPTAIN_IOS_APP_ID=<CAPPTAIN_IOS_APP_ID>
export CAPPTAIN_IOS_SDK_KEY=<CAPPTAIN_IOS_SDK_KEY>
export CAPPTAIN_IOS_REACH_ICON=icon.png

#ANDROID
export CAPPTAIN_ANDROID_REACH_ICON=icon
export CAPPTAIN_ANDROID_APP_ID=<CAPPTAIN_ANDROID_APP_ID>
export CAPPTAIN_ANDROID_GOOGLE_PROJECT_NUMBER=<CAPPTAIN_ANDROID_GOOGLE_PROJECT_NUMBER>

export DST_PATH=~
export CURDIR=$PWD


rm -rf $DST_PATH/$APP_NAME
cd $DST_PATH
cordova create $APP_NAME $PACKAGE_NAME $APP_NAME
cd $APP_NAME
cordova platform add ios
cordova platform add android
cordova plugin add cordova-plugin-console
cordova plugin add capptain-cordova 	--variable CAPPTAIN_IOS_APP_ID=$CAPPTAIN_IOS_APP_ID \
								--variable CAPPTAIN_IOS_SDK_KEY=$CAPPTAIN_IOS_SDK_KEY \
								--variable CAPPTAIN_IOS_REACH_ICON=$CAPPTAIN_IOS_REACH_ICON \
								--variable CAPPTAIN_ANDROID_APP_ID=$CAPPTAIN_ANDROID_APP_ID \
								--variable CAPPTAIN_ANDROID_GOOGLE_PROJECT_NUMBER=$CAPPTAIN_ANDROID_GOOGLE_PROJECT_NUMBER \
								--variable CAPPTAIN_ANDROID_REACH_ICON=$CAPPTAIN_ANDROID_REACH_ICON \
								--variable CAPPTAIN_REDIRECT_URL=$CAPPTAIN_REDIRECT_URL \
								--variable CAPPTAIN_ENABLE_LOG=$CAPPTAIN_ENABLE_LOG
cordova plugin add http://git-wip-us.apache.org/repos/asf/cordova-plugin-test-framework.git
cordova plugin add capptain-cordova#:tests

rm -rf www
cp -r  $CURDIR/www .

cd $CURDIR
echo "Sample project successfully created in $DST_PATH/$APP_NAME"