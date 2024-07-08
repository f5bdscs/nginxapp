## AS3 application


### How to get token froom BIG-IP NEXT CM

curl -k --user $username:$pass -H "Accept: application/json" -H "Content-Type:application/json" -X POST -d@payload.json https://10.1.
1.5/api/login | jq
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  1245  100  1200  100    45   5861    219 --:--:-- --:--:-- --:--:--  6102
{
  "access_token": "HWVKyDcMsOaOL373CPcTOG31pCeMFnmOgbBihnon1S/FANVo9ECy4WAopqXAqByprBDJkUvw9e9+Q1qqHmA3bZLymsgimPM9pdbLRh88+brdCiHCP7l9oilqYQKmwH+cg+ufehLfYUxpqIT+5KAqSL0aXIkd8VQoimBxL8eMokftKwjhzkHJrU2o4y+mGEVYuhHtYCHRucXQiPppTbw/hz1X3iwAoXSoO9ap7+r0cfdMPOMdU5w8zVKEgKO4n0XKYmkbrwsPlblZO359KRZSw7RNrICJrmI2LhlzOrbsRVDq2yZHc8tstFDp4WtCVILDTZXIwGnJJ3gMq2/f2jrw+F9PulQyUyOegQJLHc19qtm7IkiL3CwyXaXh8yj7WDFGTt9yJzjG6VHy9gugJ3gudIck2XVtbsUltneFKL9PVRUUd5YzqzxyzW1Q4kEIPlOOhYu/RLb+1qkhpnbVSEnpjdSkeI72HFTJ3S8X19xNujoQFunT57f3CnBh6q5dXiC/utSuMIoUGb8jyA9UTepzJeTMS85qXBu7xzWqJTSrNw==",
  "refresh_token": "HWVKyDcMsOaOL373CPcTOG31pCeMFnmOgbBihnon1S/FANVo9ECy4WAopqXAqByprBDJkUvw9e9+Q1qqHmA3bZLymsgimPM9pdbLRh88+brdCiHCP7l9pmxpYTCmwH+cg+ufehLfYUxpqIT+5KAqSL0aXIkd8VQoimBxL8eMokftKwjhzkHJrU2o4y+mGEVYuhHtYCHRucXQiPppTbw/hz1X3iwAoXSoO9ap7+r0cfQUKPQWTZ8GzRmTgKO/nGjJdmkbrBAYlaVZO259KBZ4wu5Ov6qLrWE+YAxgKrv7Vm7q2yZHc8tstFDp4WtCVILDTZXIwGnJJ3gMq2/f2jrw+F9PulQyUyOegQJLHc19qtm7IkiL3CwyXaXh8yj7WDFGTt9yJzjG6VHy9gugJ3gudIck2XVtbsUltmHRfZkzWwkRN5UZ3wRvx3dyx04UPTvGs5jAf5v/zrcLsCfHanvlnKiPZ5DNYHrjlgsn9dJ0ySo5AcDo0IXGeWJN+aNZZHDJlMSyGKYzc4Fo7wpUQc1jtl3nRUl2Wc2flExJPMukVg==",
  "user_id": "80c442bc-2eb5-43f2-8552-e9e5fdc3ab3a"
}


cat payload.json 
{

"username": "admin",

"password": "admin"

}
