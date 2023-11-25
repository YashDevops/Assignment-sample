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

```
    docker build -t demo .
    docker run -it demo
```

You will get an output 
  .   ____          _            __ _ _
 /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
 \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
  '  |____| .__|_| |_|_| |_\__, | / / / /
 =========|_|==============|___/=/_/_/_/
 :: Spring Boot ::                (v3.2.0)

2023-11-25T11:10:20.620Z  INFO 1 --- [           main] com.example.demo.DemoApplication         : Starting DemoApplication v0.0.1-SNAPSHOT using Java 17.0.9 with PID 1 (/app/app.jar started by root in /app)
2023-11-25T11:10:20.631Z  INFO 1 --- [           main] com.example.demo.DemoApplication         : No active profile set, falling back to 1 default profile: "default"
2023-11-25T11:10:23.497Z  INFO 1 --- [           main] com.example.demo.DemoApplication         : Started DemoApplication in 4.452 seconds (process running for 7.387)


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

