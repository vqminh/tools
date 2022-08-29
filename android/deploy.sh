# sh tools/android/deploy.sh 1.0.10 1605867014
set -e
if [[ $# -eq 0 ]] ; then
    echo 'sh tools/android/deploy.sh 1.0.10 1605867014'
    exit 1
fi
echo versionName=$1
echo versionCode=$2
export VERSION_NAME=$1
export VERSION_CODE=$2
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk11.0.10-msft.jdk/Contents/Home
export PATH=$JAVA_HOME/bin:$PATH
export ANDROID_NDK_HOME=/Users/mivu/Library/Android/sdk/ndk/23.0.7196353/
cat src/config/version.android.js
git fetch origin main
git merge origin/main
printf "export const APP_VERSION = '$1';\nexport const APP_BUILD = '$2';\n" > src/config/version.android.js
cd android
./gradlew bundleRelease
git add ../src/config/version.android.js
git commit -m "android $1 $2"
git push
