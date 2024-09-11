module "vpc" {
    source  = "./vn"

    project_id   = var.project_id
    network_name = var.network_name

    shared_vpc_host = false
}

module "subnet" {
  source = "./subnets"
  project_id   = var.project_id
  network_name = var.network_name
  subnets = [
        {
            subnet_name           = var.subnet_name["subnet-01"]
            subnet_ip             = var.subnet_ip["subnet-ip-01"]
            subnet_region         = var.subnet_region
        },
        {
            subnet_name           = var.subnet_name["subnet-02"]
            subnet_ip             = var.subnet_ip["subnet-ip-02"]
            subnet_region         = var.subnet_region
            subnet_private_access = "true"
            subnet_flow_logs      = "true"
            description           = "This subnet has a description"
            # purpose               = "INTERNAL_HTTPS_LOAD_BALANCER"
            role                  = "ACTIVE"
        },
        {
            subnet_name                  = var.subnet_name["subnet-03"]
            subnet_ip                    = var.subnet_ip["subnet-ip-03"]
            subnet_region                = var.subnet_region
            subnet_flow_logs             = "true"
            subnet_flow_logs_interval    = "INTERVAL_10_MIN"
            subnet_flow_logs_sampling    = 0.7
            subnet_flow_logs_metadata    = "INCLUDE_ALL_METADATA"
            subnet_flow_logs_filter_expr = "true"
        }
    ]

    secondary_ranges = {
        subnet-01 = [
            {
                range_name    = "subnet-01-secondary-01"
                ip_cidr_range = var.ip_cidr_range
            },
        ]

        subnet-02 = []
    }
  depends_on = [ module.vpc ]
}