# sh tools/android/deploy.sh 1.0.10 1605867014
sh ${0%/*}/init.sh $1 $2
git fetch origin main
git merge origin/main
cd android
./gradlew bundleRelease -PversionName="$1" -PversionCode=$2
git add ../src/config/version.android.js
git commit -m "android $1 $2"
git push
