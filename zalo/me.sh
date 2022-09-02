curl \
-X GET \
-H "access_token: $1" \
"https://graph.zalo.me/v2.0/me?fields=id,name,picture"