resource "bigipnext_cm_as3_deploy" "test" {
  target_address = "10.1.1.10"
  as3_json       = <<EOT
{
    "class": "ADC",
    "schemaVersion": "3.45.0",
    "id": "example-declaration-01",
    "label": "Sample 1",
    "remark": "Simple HTTP application with round robin pool",
    "next-cm-tenant01": {
        "class": "Tenant",
        "next-cm-app01": {
            "class": "Application",
            "template": "http",
            "serviceMain": {
                "class": "Service_HTTP",
                "virtualAddresses": [
                    "10.1.20.10"
                ],
                "pool": "next-cm-pool01"
            },
            "next-cm-pool01": {
                "class": "Pool",
                "monitors": [
                    "http"
                ],
                "members": [
                    {
                        "servicePort": 8080,
                        "serverAddresses": [
                            "10.1.20.4"
                                        ]
                    }
                ]
            }
        }
    }
}
EOT
}
