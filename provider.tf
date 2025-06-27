provider "ibm" {
	region           = "ca-mon"
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

terraform {
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
      version = "1.79.2"
    }
  }
}



