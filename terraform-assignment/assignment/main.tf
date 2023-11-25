module "vpc" {
    source = "../modules/aws-cloud/vpc/v1"
    vpc_details = var.vpc_details

}

module "subnets" {
    source = "../modules/aws-cloud/subnet/v1"
    subnet_details = var.subnet_details
    depends_on = [module.vpc]
}

module "eip" {
    source = "../modules/aws-cloud/eip/v1"
    eip_details = var.eip_details
    depends_on = [module.subnets]

}

module "nat" {
    source = "../modules/aws-cloud/nat-gateway/v1"
    natgateway_details = var.natgateway_details
    depends_on = [module.subnets]
    
}

module "s3" {
    source = "../modules/aws-cloud/s3/v1"
    s3_details = var.s3_details

}

module "iam" {
    source = "../modules/aws-cloud/iam/v1"
    iam_role_details = var.iam_role_details

}

module "sg" {
    source = "../modules/aws-cloud/sg/v1"
    sg_details = var.sg_details
}


module "ec2" {
    source = "../modules/aws-cloud/ec2/v1"
    instance_configurations = var.instance_configurations
}


module "cw-alarms" {
    source = "../modules/aws-cloud/cloudwatch-alarm/v1"
    cloudwatch_details = var.cloudwatch_details
}