date
cd functions
yarn
if [ $# -eq 0 ]
  then
  firebase deploy --only functions
else
  firebase deploy --only functions:$1
fi
