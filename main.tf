resource "ibm_is_vpc" "vpc1" {
  name = "vpc-can-be-deleted"
}

resource "ibm_is_subnet" "subnet1" {
  name                     = "subnet-can-be-deleted"
  vpc                      = ibm_is_vpc.vpc1.id
  zone                     = "ca-mon-1"
  total_ipv4_address_count = 256
}

data "ibm_resource_group" "resource_group" {
  name = "Default"
}

resource "ibm_container_vpc_cluster" "cluster" {
  name              = "roks-vpc-cluster-can-be-deleted"
  vpc_id            = ibm_is_vpc.vpc1.id
  flavor            = "bx2.4x16"
  worker_count      = 3
  resource_group_id = data.ibm_resource_group.resource_group.id
  kube_version      = "4.17" 
  zones {
    subnet_id = ibm_is_subnet.subnet1.id
    name      = "ca-mon-1"
  }
}
