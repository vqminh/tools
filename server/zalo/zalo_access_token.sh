curl \
-X POST \
-H "Content-Type: application/x-www-form-urlencoded" \
-H "secret_key: YLL5EGPHDhsM88uL4s86" \
--data-urlencode 'code=ikSDKT1V906rxmjOqbOc3BZb3rhQIprk_RDCUPbKFNQdhazHcLydPv6dVdwQLZTEl89HMu1f8cdhlsfptGiHMhtuL7VOF3nypzWMMkKKHNZen3bCYWbMQBNeFac-E5X-gT4_H8mrJKEcvmToZ5CjPPECRM-ZIXXecw1_Olvs1qgQbtvBf6CNRPdRCL_v7s1wm_GE8iuyVn3kyIOrp0HoUDZn8KZP55PXmzWjTl1XM7VuhGPszLreJzIGFMlqTsec_ACZCPPLL1YfZpaVdNf4IRcgOao_G3nsfBPBUcfCKe0VODH98m4' \
--data-urlencode 'app_id=1008607009592483660' \
--data-urlencode 'grant_type=authorization_code' \
--data-urlencode 'code_verifier=your_code_verifier' \
'https://oauth.zaloapp.com/v4/access_token'