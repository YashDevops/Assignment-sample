# Assignment 


## Terraform Assignment

Each resource is created as a Terraform map of objects in a separate module and is imported into main.tf inside the assignment folder.

# Resourcs Created
- vpc
- subnet
- nat-gateway
- s3 bucket
- IAM role
- sg group
- ec2 instance

# Docker + Kubernetes

A multistage Dockerfile has been created, and the final Docker image used is distroless to make our container more secure. Further security and linting can be applied by using tools such as Hadolint, Trivy, and others in the CI pipelines.


# Python Scripts

Script created 
 - scan public buckets  
 ```
    python3 s3_public_access.py 
 ```
- Open Security Groups
```
    python3 open_security_group.py --region ap-south-1 
```
- Scan all *.txt file
```
    python3 directory_parser.py --directory /Users/yashshah
```

- SSL Certificate Validator

```
 python3 ssl_validator.py www.google.com #will say ssl i valid
 
 python3 ssl_validator.py https://expired.badssl.com # ssl certificate invalid
 
 
```

