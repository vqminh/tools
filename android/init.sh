set -e
if [[ $# -eq 0 ]] ; then
    echo "sh tools/android/deploy.sh ${VERSION_NAME} ${VERSION_CODE}"
    exit 1
fi
export VERSION_NAME=$1
export VERSION_CODE=$2
echo versionName=$VERSION_NAME
echo versionCode=$VERSION_CODE
printf "export const APP_VERSION = '$VERSION_NAME';\nexport const APP_BUILD = '$VERSION_CODE';\n" > src/config/version.android.js
