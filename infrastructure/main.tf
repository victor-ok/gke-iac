module "network" {
  source                  = "./module/network"
  network_name            = var.network_name
  routing_mode            = var.routing_mode
  mtu                     = var.mtu
  auto_create_subnetworks = var.auto_create_subnetworks
  ip_cidr_range           = var.ip_cidr_range
  region                  = var.region
  project_id              = var.project_id

  zone           = var.zone
  cluster_name   = var.cluster_name
  node_pool_name = var.node_pool_name
}

module "kubernetes" {
  source     = "./module/kubernetes"
  namespace  = "dev"
  depends_on = [module.network]
}

# module "storage" {
#   source         = "./module/storage"
#   serviceAccount = var.serviceAccount
# }

# module "gke" {
#   source         = "./module/gke"
#   zone           = var.zone
#   project_id     = var.project_id
#   cluster_name   = var.cluster_name
#   node_pool_name = var.node_pool_name
#   depends_on = [ module.network ]
# }




# module "subnet" {
#   source = "./module/subnet"
#   network_name = var.network_name
#   ip_cidr_range = var.ip_cidr_range
#   region = var.region
#   depends_on = [ module.vpc ]
# }

# module "router" {
#   source = "./module/router"
#   region = var.region
# }

# module "nat" {
#   source = "./module/nat"
#   region = var.region
#   depends_on = [ module.router ]
# }

# module "Firewall" {
#   source = "./module/firewall"
#   project_id = var.project_id
#   depends_on = [ 
#     module.vpc,
#     module.subnet,
#     module.router,
#     module.nat
#   ]
# }