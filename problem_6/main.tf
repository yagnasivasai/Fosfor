
module "myvpc" {
  source = "./modules/vpc"

}

module "worker" {
  source = "./modules/ec2_worker"
  subnet_id = module.myvpc.subnetpublicid
  securitygroup = module.myvpc.sg_pub_id
}

module "master" {
  source = "./modules/ec2_master"
  subnet_id = module.myvpc.subnetpublicid
  securitygroup = module.myvpc.sg_pub_id
  
}

