provider "ibm" {
	region           = "ca-mon"
        visibility       = "private" 
}

terraform {
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
      version = "1.79.2"
    }
  }
}
