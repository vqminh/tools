# sh ios/deploy.sh 2.4.1 152
set -e
echo "Current $MARKETING_VERSION $CURRENT_PROJECT_VERSION"
echo MARKETING_VERSION=$1
echo CURRENT_PROJECT_VERSION=$2
export MARKETING_VERSION=$1
export CURRENT_PROJECT_VERSION=$2
git fetch origin main
git merge origin/main
printf "export const APP_VERSION = '$1';\nexport const APP_BUILD = '$2';\n" > src/config/version.ios.js
sed -i .backup  -E "s/CURRENT_PROJECT_VERSION = [0-9]+;/CURRENT_PROJECT_VERSION = $2;/g;s/MARKETING_VERSION = [0-9.]+;/MARKETING_VERSION = $1;/g" ios/luki.xcodeproj/project.pbxproj
cd ios
xcodebuild -workspace luki.xcworkspace -configuration Release -scheme luki -allowProvisioningUpdates archive | grep error
open luki.xcworkspace
git add luki.xcodeproj/project.pbxproj ../src/config/version.ios.js
git commit -m "ios $1 $2"
git push
# source ./ios.sh && /Applications/Xcode.app//Contents/Developer/usr/bin/altool --upload-app -f "${APP_NAME}.ipa" -u $APP_STORE_USERNAME -p $APP_STORE_PASSWORD
