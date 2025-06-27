provider "ibm" {
	region           = "ca-mon"
  ibmcloud_api_key = var.ibmcloud_api_key
}

provider "kubernetes" {
  host                   = data.ibm_container_cluster_config.cluster.host
  token                  = data.ibm_container_cluster_config.cluster.token
  cluster_ca_certificate = data.ibm_container_cluster_config.cluster.ca_certificate
}

terraform {
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
      version = "1.79.2"
    }
  }
}



