curl -X POST \
"https://test062020.myshopify.com/admin/api/2021-01/storefront_access_tokens.json" \
-H "Accept: application/json" \
-H "Content-Type: application/graphql" \
-H "X-Shopify-Access-Token: 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" \
-d '{ "storefront_access_token": { "title": "Mobile" }}'