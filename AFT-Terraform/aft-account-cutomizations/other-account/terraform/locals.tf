locals {
  account_name       = "account-lz2.0-shared-dev"
  primary_vpc_name   = "vpc-shared-dev-mum-001"
  primary_region     = "ap-south-1"
  availability_zones = ["${local.primary_region}a", "${local.primary_region}b"]

  # Primary VPC CIDR
  primary_vpc_cidr = "10.164.0.0/16"

  # Private TGW subnet list, name and route table
  private_tgw_subnet_list = ["10.164.0.0/28", "10.164.0.16/28"]
  private_tgw_subnet_name = ["snt-shared-dev-tgwattach-mum-a01", "snt-shared-dev-tgwattach-mum-b01"]
  private_tgw_rtb_name    = "rtb-shared-dev-tgwattach-mum-01"

  # Public subnet list, name and route table FOR ALB
  public_alb_subnet_list = ["10.164.2.0/23", "10.164.4.0/23"]
  public_alb_subnet_name = ["snt-shared-dev-alb-mum-a01", "snt-shared-dev-alb-mum-b01"]
  public_alb_rtb_name    = "rtb-shared-dev-alb-mum-01"

  # Private Subnet List, name and route table for WEB
  private_subnet_list_web     = ["10.164.32.0/19", "10.164.64.0/19"]
  private_subnet_name_web     = ["snt-shared-dev-web-mum-a01", "snt-shared-dev-web-mum-b01"]
  private_subnet_rtb_name_web = "rtb-shared-dev-web-private-mum-01"

  # Private Subnet List, name and route table for APP
  private_subnet_list_app     = ["10.164.96.0/19", "10.164.128.0/19"]
  private_subnet_name_app     = ["snt-shared-dev-app-mum-a01", "snt-shared-dev-app-mum-b01"]
  private_subnet_rtb_name_app = "rtb-shared-dev-app-private-mum-01"


  # Private Subnet List, name and route table for DB
  private_subnet_list_db     = ["10.164.160.0/19", "10.164.192.0/19"]
  private_subnet_name_db     = ["snt-shared-dev-db-mum-a01", "snt-shared-dev-db-mum-b01"]
  private_subnet_rtb_name_db = "rtb-shared-dev-db-private-mum-01"


  network_account_id = module.aft_account_list.param_name_values["${local.ssm_parameter_path_account_list}account-lz2.0-network"]
  network_tgw_id     = data.aws_ec2_transit_gateway.primary_network_tgw.id
  shared_subnet_list = [
    "arn:aws:ec2:ap-south-1:679578531064:subnet/subnet-042b0e68ab37ffb04",
    "arn:aws:ec2:ap-south-1:679578531064:subnet/subnet-02f4ee2479ce58ab6",
    "arn:aws:ec2:ap-south-1:679578531064:subnet/subnet-0d23cc67219c033cc",
    "arn:aws:ec2:ap-south-1:679578531064:subnet/subnet-02b781ffa0fba2478",
    "arn:aws:ec2:ap-south-1:679578531064:subnet/subnet-0c1da1ef75265b55c",
    "arn:aws:ec2:ap-south-1:679578531064:subnet/subnet-0696dd9cfecac556c",
    "arn:aws:ec2:ap-south-1:679578531064:subnet/subnet-01db556e29e4c825a",
    "arn:aws:ec2:ap-south-1:679578531064:subnet/subnet-00657867cfc3f87c1"
  ]
  sharing_dev_account_list = ["024259687925", "196533851584"]


  primary_igw_name           = "igw-shared-dev-mum-01"
  public_nat_rt_name         = "rtb-shared-dev-publicnat-mum01"
  private_tgw_rt_name        = "rtb-shared-dev-privatetgw-mum01"
  private_fw_rt_name         = "rtb-shared-dev-privatefw-mum01"
  tgw_attachment_name        = "tgw-shared-dev-tgwattach-mum-01"
  appliance_mode_support     = "enable"
  tgw_default_rt_association = false
  tgw_default_rt_propagation = false

  instance_tenancy                 = "default"
  enable_dns_support               = true
  enable_dns_hostnames             = true
  assign_generated_ipv6_cidr_block = false

  common_tags = {
    application-owner           = "mustansir burhanpurwala"
    application-technical-Group = "CCOE"
    requester-name              = "25001523@mahindra.com"
    cost-center                 = "ratio"
    business-unit               = "Corporate IT"
    department                  = "CCOE"
    created-by                  = "Bcone-60194@mahindra.com"
    created-date                = "13-Dec-2022"
    environment                 = "DEV"
    business-project-name       = "Shared-Dev"
    application-landscape       = "shared-dev"
    shared-dedicate             = "Common Services"
    application-criticality     = "MC"
    compliance                  = "NA"
  }

  ssm_parameter_path              = "/mm/aft/account_customization/output/"
  ssm_parameter_path_org_id       = "/mm/static/master/org-id"
  ssm_parameter_path_account_list = "/mm/aft/account_id/"

  # export outputs of type string
  export_output = {
    vpc_id            = aws_vpc.shared_dev_vpc.id
    vpc_cidr          = aws_vpc.shared_dev_vpc.cidr_block
    tgw_attachment_id = aws_ec2_transit_gateway_vpc_attachment.tgw_network.id
  }
  # export outputs of type list
  export_list_output = {

  }
}
