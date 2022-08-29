# sh tools/android/deploy.sh 1.0.10 1605867014
sh ${0%/*}/init.sh
git fetch origin main
git merge origin/main
cd android
./gradlew bundleRelease
git add ../src/config/version.android.js
git commit -m "android $1 $2"
git push
