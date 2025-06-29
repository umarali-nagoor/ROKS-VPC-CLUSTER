resource "ibm_is_vpc" "vpc1" {
  name = "vpc-can-be-deleted9"
}

resource "ibm_is_subnet" "subnet1" {
  name                     = "subnet-can-be-deleted9"
  vpc                      = ibm_is_vpc.vpc1.id
  zone                     = "ca-mon-1"
  total_ipv4_address_count = 256
}

data "ibm_resource_group" "resource_group" {
  name = "Default"
}

resource "ibm_container_vpc_cluster" "cluster" {
  name              = "roks-vpc-cluster-can-be-deleted9"
  vpc_id            = ibm_is_vpc.vpc1.id
  worker_count      = 3
  resource_group_id = data.ibm_resource_group.resource_group.id
  flavor            = "bx3d.4x20"
  disable_public_service_endpoint = true
  zones {
    subnet_id = ibm_is_subnet.subnet1.id
    name      = "ca-mon-1"
  }
}

data "ibm_container_cluster_config" "cluster" {
  cluster_name_id = ibm_container_vpc_cluster.cluster.id
}

resource "kubernetes_namespace" "example" {
  metadata {
    name = "terraform-example-namespace"
  }
}

