yarn
yarn build
firebase deploy --only hosting
rm -rf deployed-source-map
cp -rf build deployed-source-map