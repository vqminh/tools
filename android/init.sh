set -e
if [[ $# -eq 0 ]] ; then
    echo "sh tools/android/deploy.sh } version build"
    exit 1
fi
echo "Version: $1 Build: $2"
printf "export const APP_VERSION = '$1';\nexport const APP_BUILD = '$2';\n" > src/config/version.android.js
