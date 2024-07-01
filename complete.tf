 terraform {
  required_providers {
    tfe = {
      version = "~> 0.54.0"
    }
  }
}

locals {

  prefix = random_string.pre.result

}

resource "random_string" "pre" {
  length  = 4
  special = false
}


provider "tfe" {
  hostname = "app.terraform.io"
}

# Create an organization
resource "tfe_organization" "Org" {
  name  = "${local.prefix}-student"
  email = "s.shitole@f5.com"
  # ...
}

resource "tfe_workspace" "myworkspace" {
  name         = "${local.prefix}-workspace"
  organization = tfe_organization.Org.name
  tag_names    = ["workshop"]
}
output "Your_Workshop_HCP_Org" {
  value = "${local.prefix}-student"
}
output "Your_Workspace_configured" {
  value = "${local.prefix}-workspace"
}

output "prefix" {
  value = random_string.pre.result
}

# Define a Terraform Cloud/Enterprise agent pool
resource "tfe_agent_pool" "next-agent-pool" {
  # Specifies the name of the agent pool
  name                 = "next-pool"
  
  # Specifies the organization to which the agent pool belongs
  organization         = tfe_organization.Org.name
  
  # Indicates whether the agent pool is scoped to the organization (default: true)
  organization_scoped  = true
}

# Generate an agent token for authentication with the agent pool
resource "tfe_agent_token" "next-agent-token" {
  # Specifies the ID of the agent pool to associate the token with
  agent_pool_id = tfe_agent_pool.next-agent-pool.id
  
  # Provides a description for the agent token
  description   = "next-agent-token"
}

resource "tfe_organization_default_settings" "org_default" {
  organization           = tfe_organization.Org.name
  default_execution_mode = "agent"
  default_agent_pool_id  = tfe_agent_pool.next-agent-pool.id
}

resource "tfe_variable_set" "next_credentials" {
  name         = "NEXT CM CREDENTIALS"
  description  = "Variable set applied to all workspaces."
  global       = true
  organization = tfe_organization.Org.name
}

resource "tfe_variable" "host" {
  key             = "host"
  value           = "https://10.1.1.5"
  category        = "terraform"
  description     = "Host address of Next CM"
  variable_set_id = tfe_variable_set.next_credentials.id
}

resource "tfe_variable" "username" {
  key             = "username"
  value           = "admin"
  category        = "terraform"
  description     = "Next CM  username"
  variable_set_id = tfe_variable_set.next_credentials.id


}

resource "tfe_variable" "password" {
  key             = "password"
  value           = "F5labnet!"
  category        = "terraform"
  description     = "Next CM password"
  variable_set_id = tfe_variable_set.next_credentials.id
}

# Define the provider
provider "github" {
  token = var.token
  owner = var.github_organization
}

# Create a new repository
resource "github_repository" "example_repo" {
  name        = "${local.prefix}-student"
  description = "An example repository created using Terraform"
  visibility  = "public" # Can be public, private, or internal

  # Optional settings
  has_issues  = true
  has_projects = true
  has_wiki    = true

  # Example of a repository topic
  topics = ["terraform", "example"]

auto_init = true
   
}

 resource "github_repository_file" "foo" {
  repository          = github_repository.example_repo.name
  branch              = "main"
  file                = ".gitignore"
  content             = "**/*.tfstate"
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "s.shitole@f5.com"
  overwrite_on_create = true
  depends_on = [ github_repository.example_repo ]
}

resource "github_repository_file" "uploadas3" {
  repository          = github_repository.example_repo.name
  branch              = "main"
  file                = "as3.json"
  content             = <<EOT
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
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "s.shitole@f5.com"
  overwrite_on_create = true
  depends_on = [ github_repository.example_repo ]
}


resource "github_repository_file" "createTF" {
  repository          = github_repository.example_repo.name
  branch              = "main"
  file                = "app.tf"
  content             = <<EOT
  terraform {
  required_providers {
    bigipnext = {
      source  = "F5Networks/bigipnext"
      version = "1.2.0"
    }
  }
  cloud {
    organization = "${local.prefix}-student"

    workspaces {
      name = "${local.prefix}-workspace"
    }
  }
}
variable "host" {}
variable "username" {}
variable "password" {}
provider "bigipnext" {
  username = var.username
  password = var.password
  host     = var.host
}

resource "bigipnext_cm_as3_deploy" "test" {
  target_address = "10.1.1.10"
  as3_json       = file("as3.json")
  }
  EOT
}
