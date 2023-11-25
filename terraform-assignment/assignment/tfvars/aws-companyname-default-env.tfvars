region = "ap-south-1"

vpc_details = {
  1 = {
    Name = "sample-vpc"
    cidr_block = "10.0.0.0/16"
    tags = {"Name":"sample-terraform-vpc","env":"dummy","info:terraform":"true","info:description":"sample bucket for s3","org:email":"yash.shah@assignment.com","org:team":"infra"}
    enable_dns_support   = true
    enable_dns_hostnames = true
    instance_tenancy = "default"
  }
}

subnet_details = {
  public-1a = {
    cidr_block = "10.0.1.0/24"
    Name = "sample-public-subnet-1a"
    availability_zone = "ap-south-1a"
    vpc_id = "vpc-02206a7449b1966b5"
    tags = {"Name":"sample-terraform-vpc","env":"dummy","info:terraform":"true","info:description":"sample bucket for s3","org:email":"yash.shah@assignment.com","org:team":"infra"}
    map_public_ip_on_launch = true
  },
  public-1b = {
    cidr_block = "10.0.2.0/24"
    Name = "sample-public-subnet-1b"
    availability_zone = "ap-south-1b"
    vpc_id = "vpc-02206a7449b1966b5"
    tags = {"Name":"sample-terraform-vpc","env":"dummy","info:terraform":"true","info:description":"sample bucket for s3","org:email":"yash.shah@assignment.com","org:team":"infra"}
    map_public_ip_on_launch = true
  },
  private-1a = {
    cidr_block = "10.0.3.0/24"
    Name = "sample-private-subnet-1a"
    availability_zone = "ap-south-1a"
    vpc_id = "vpc-02206a7449b1966b5"
    tags = {"Name":"sample-terraform-vpc","env":"dummy","info:terraform":"true","info:description":"sample bucket for s3","org:email":"yash.shah@assignment.com","org:team":"infra"}
    map_public_ip_on_launch = false
  },
  private-1b = {
    cidr_block = "10.0.4.0/24"
    Name = "sample-private-subnet-1b"
    availability_zone = "ap-south-1b"
    vpc_id = "vpc-02206a7449b1966b5"
    tags = {"Name":"sample-terraform-vpc","env":"dummy","info:terraform":"true","info:description":"sample bucket for s3","org:email":"yash.shah@assignment.com","org:team":"infra"}
    map_public_ip_on_launch = false
  }
}

eip_details = {
  sample-eip = {
    Name = "sample-eip-for-nat"
    vpc = true
  }
}

natgateway_details = {
1 = {
    subnet_id  = "subnet-0df0bb600c292dcb0"
    Name        = "test"
    allocation_id = "eipalloc-006471b6b3b3b469a"
    connectivity_type = "public"
    prefix      = "sample-test"
    tags = {}
  }
}


s3_details = {
1 = {
  bucket = "sample-s3-test-dummy-bucket"
  version_enable = false
  lifecycle_infrequent_storage_transition_enabled = false
  lifecycle_glacier_transition_enabled = false
  lifecycle_expiration_enabled = false
  cors_rule = []
  bucket_policy_required = false
  logging_enabled = false
  s3_policy_location = "s3-policy-json/default-policy.json"
  sse_algorithm = "AES256"
  tags = {"env":"dummy","info:terraform":"true","info:description":"sample bucket for s3","org:email":"yash.shah@assignment.com","org:team":"infra"}
     }
 }


iam_role_details = {
    1 = {
        name = "sample-IAM-role"
        policy = "iam-policy-json/sample-iam-policy.json"
        tags = {"env":"dummy","info:terraform":"true","info:description":"sample bucket for s3","org:email":"yash.shah@assignment.com","org:team":"infra"} 
    }
}


sg_details = {
  1 = { 
          Name = "sample-sg"
          sg_description = "This security group is for sample sg"
          vpc_id = "vpc-00f73c7af883b2b4c"
          ingress = [
              {
                    description = "this default rule to accept all traffic from private CIDR"
                    from_port = 0
                    to_port = 0
                    protocol = "-1"
                    cidr_blocks = ["10.0.0.0/16"]
                  }]
          egress = [
                 {
                    description = "all out going traffic"
                    from_port = 0
                    to_port = 0
                    protocol = "-1"
                    cidr_blocks = ["0.0.0.0/0"]
                  }]
        tags = { "Name" = "sample-sg","env":"dummy","info:terraform":"true","info:description":"sample bucket for s3","org:email":"yash.shah@assignment.com","org:team":"infra"} 
      }
    } 

instance_configurations = {
  sample-instance = {
      ami                    = "ami-0287a05f0ef0e9d9a"
      instance_type          = "t2.micro"
      user_data              = "#!/bin/bash\necho 'Hello from user data!'"
      tags = { "Name" = "sample-ec2","env":"dummy","info:terraform":"true","info:description":"sample bucket for s3","org:email":"yash.shah@assignment.com","org:team":"infra"} 
    }
}

cloudwatch_details = {
  1 = {
    alarm_name                = "terraform-test-foobar5"
    comparison_operator       = "GreaterThanOrEqualToThreshold"
    evaluation_periods        = 2
    metric_name               = "CPUUtilization"
    namespace                 = "AWS/EC2"
    period                    = 120
    statistic                 = "Average"
    threshold                 = 80
    alarm_description         = "This metric monitors ec2 cpu utilization"
    insufficient_data_actions = []
  }
}