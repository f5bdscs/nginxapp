terraform {
  required_providers {
    bigipnext = {
      source  = "F5Networks/bigipnext"
      version = "1.2.0"
    }
  }
}





provider "bigipnext" {
  username = "admin"
  password = "F5labnet!"
  host     = "https://10.1.1.5"
}
