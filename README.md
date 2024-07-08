### API documentation
https://clouddocs.f5.com/products/bigip-next/mgmt-api/latest/ApiReferences/bigip_public_api_ref/r_openapi-next.html


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

```

token=$(curl -ks --location 'https://10.1.1.5/api/login' \
--header 'Content-Type: application/json' \
--data '{
    "username": "admin",
    "password": "F5labnet!"
}' | jq -r '.access_token')

echo $token
```

### Display applications

```
curl -sk     -H "Authorization: Bearer $token"     -H "Content-Type: application/json"     "https://10.1.1.5/api/v1/spaces/default/appsvcs/applications" | jq 
{
  "_embedded": {
    "applications": [
      {
        "_links": {
          "self": {
            "href": "/api/v1/spaces/default/appsvcs/applications/1bb0db79-871d-4c73-840e-4203460b847e"
          }
        },
        "active_alerts": "{NULL}",
        "gslb_enabled": false,
        "health": "good",
        "id": "1bb0db79-871d-4c73-840e-4203460b847e",
        "modified": "2024-06-21T22:41:15.003692Z",
        "name": "MyChartNEW",
        "running_tasks_count": {
          "create_tasks": 0,
          "delete_tasks": 0,
          "update_tasks": 0
        },
        "security_policies": [],
        "successful_instances": 0,
        "tenant_name": "tenantLFwvm50tQJmKsA1EU91H4xw",
        "type": "FAST"
      },
      {
        "_links": {
          "self": {
            "href": "/api/v1/spaces/default/appsvcs/applications/1cca0a46-a74f-4b7b-b13d-977e77596f56"
          }
        },
        "active_alerts": "{NULL}",
        "gslb_enabled": false,
        "health": "good",
        "id": "1cca0a46-a74f-4b7b-b13d-977e77596f56",
        "modified": "2024-06-21T22:27:02.936601Z",
        "name": "newHealth",
        "running_tasks_count": {
          "create_tasks": 0,
          "delete_tasks": 0,
          "update_tasks": 0
        },
        "security_policies": [],
        "successful_instances": 0,
        "tenant_name": "tenantNHAQlM6aTBSYHuO90N0rcVg",
        "type": "FAST"
      },
      {
        "_links": {
          "self": {
            "href": "/api/v1/spaces/default/appsvcs/applications/2a45ac11-83c6-4d55-ace0-508674052707"
          }
        },
        "active_alerts": "{NULL}",
        "deployments_count": {
          "total": 1,
          "completed": 1
        },
        "fqdn": "",
        "gslb_enabled": false,
        "health": "good",
        "id": "2a45ac11-83c6-4d55-ace0-508674052707",
        "instances": [
          {
            "id": "c6236ad6-8cc2-49a2-bb6f-b22f4e5819cc",
            "hostname": "big-ip-next-03.example.com",
            "address": "10.1.1.10",
            "systems": [
              {
                "id": "d38ea2dc-ac9a-4731-8618-b371d56ffb1d"
              }
            ]
          }
        ],
        "modified": "2024-06-21T22:18:44.710456Z",
        "name": "ThisGreat",
        "running_tasks_count": {
          "create_tasks": 0,
          "delete_tasks": 0,
          "update_tasks": 0
        },
        "security_policies": [
          {
            "id": "0cf235f0-7e6e-4d0c-be9e-d0e4b02bb842",
            "policy": "WAF",
            "enforcement_mode": "blocking"
          }
        ],
        "successful_instances": 1,
        "tenant_name": "tenantqPphO7dXQYCz4XOTJAT6wg",
        "type": "FAST"
      },
      {
        "_links": {
          "self": {
            "href": "/api/v1/spaces/default/appsvcs/applications/4c3a8bf7-da6e-445c-8a6d-c14c7918d327"
          }
        },
        "active_alerts": "{NULL}",
        "deployments_count": {
          "total": 1,
          "completed": 1
        },
        "fqdn": "",
        "gslb_enabled": false,
        "health": "good",
        "id": "4c3a8bf7-da6e-445c-8a6d-c14c7918d327",
        "instances": [
          {
            "id": "c6236ad6-8cc2-49a2-bb6f-b22f4e5819cc",
            "hostname": "big-ip-next-03.example.com",
            "address": "10.1.1.10",
            "systems": [
              {
                "id": "d38ea2dc-ac9a-4731-8618-b371d56ffb1d"
              }
            ]
          }
        ],
        "modified": "2024-05-31T23:33:35.333898Z",
        "name": "theLabApp",
        "running_tasks_count": {
          "create_tasks": 0,
          "delete_tasks": 0,
          "update_tasks": 0
        },
        "security_policies": [],
        "successful_instances": 1,
        "tenant_name": "tenantt2kqN8tBR7u0dy91Bf99PEkw",
        "type": "FAST"
      },
      {
        "_links": {
          "self": {
            "href": "/api/v1/spaces/default/appsvcs/applications/56ffeea9-43ec-43df-8ea2-7bcd8d0916da"
          }
        },
        "active_alerts": "{NULL}",
        "deployments_count": {
          "total": 1,
          "completed": 1
        },
        "fqdn": "",
        "gslb_enabled": false,
        "health": "good",
        "id": "56ffeea9-43ec-43df-8ea2-7bcd8d0916da",
        "instances": [
          {
            "id": "c6236ad6-8cc2-49a2-bb6f-b22f4e5819cc",
            "hostname": "big-ip-next-03.example.com",
            "address": "10.1.1.10",
            "systems": [
              {
                "id": "d38ea2dc-ac9a-4731-8618-b371d56ffb1d"
              }
            ]
          }
        ],
        "modified": "2024-06-28T21:06:54.73357Z",
        "name": "top",
        "running_tasks_count": {
          "create_tasks": 0,
          "delete_tasks": 0,
          "update_tasks": 0
        },
        "security_policies": [],
        "successful_instances": 1,
        "tenant_name": "tenantdYB5rEVLSBux5Gf90ufEmlQ",
        "type": "FAST"
      },
      {
```
