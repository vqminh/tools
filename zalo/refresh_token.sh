curl \
-X POST \
-H "Content-Type: application/x-www-form-urlencoded" \
-H "secret_key: YLL5EGPHDhsM88uL4s86" \
--data-urlencode "refresh_token=$1" \
--data-urlencode 'app_id=1008607009592483660' \
--data-urlencode 'grant_type=refresh_token' \
'https://oauth.zaloapp.com/v4/access_token'