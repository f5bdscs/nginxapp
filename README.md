## AS3 application


### How to get token froom BIG-IP NEXT CM
```
curl -k --user $username:$pass -H "Accept: application/json" -H "Content-Type:application/json" -X POST -d@payload.json https://10.1.
1.5/api/login | jq

```
Response
```
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  1245  100  1200  100    45   5861    219 --:--:-- --:--:-- --:--:--  6102
{
  "access_token": "HWVKyDcMsOaOL373CPcTOG31pCeMFnmOgbBihnon1S/FANVo9ECy4WAopqXAqByprBDJkUvw9e9+Q1qqHmA3bZLymsgimPM9pdbLRh88+brdCiHCP7l9oilqYQKmwH+cg+ufehLfYUxpqIT+5KAqSL0aXIkd8VQoimBxL8eMokftKwjhzkHJrU2o4y+mGEVYuhHtYCHRucXQiPppTbw/=",
  "refresh_token": "HWVKyDcMsOaOL373CPcTOG31pCeMFnmOgbBihnon1S/FANVo9ECy4WAopqXAqByprBDJkUvw9e9+Q1qqHmA3bZLymsgimPM9pdbLRh88+brdCiHCP7l9pmxpYTCmwH+cg+ufehLfYUxpqIT+5KAqSL0aXIkd8VQoimBxL8eMokftKwjhzkHJrU2o4y+mGEVYuhHtYCHRucXQiPppTbw/g==",
  "user_id": "80c442bc-2eb5-43f2-8552-e9e5fdc3ab3a"
}
```

```
cat payload.json 
{

"username": "admin",

"password": "admin"

}
```
