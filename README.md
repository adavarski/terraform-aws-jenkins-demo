# terraform_aws_jenkins
This is simple practice project to use terraform to deploy AMI and Jenkins on AWS using Terraform
Then build and run spring boot application there.

## Prerequisites
Please export environment variables to authenticate with AWS:
```
$ export TF_VAR_access_key=$AWS_ACCESS_KEY # exposed as access_key in terraform scripts
$ export TF_VAR_secret_key=$AWS_SECRET_ACCESS_KEY # exposed as secret_key in terraform scripts
```

### Run 'terraform plan'
    terraform plan

### Run 'terraform apply'
    terraform apply

### Run 'terraform destroy'
    terraform destroy

## Jenkins 
Jenkins UI can be reached at at port 8080. Example: http://"external-ip of your EC2 instance":8080
1. Jenkins initial set up needs to be done for first time. This is one time setup like deciding admin use and plugins.
2. Make sure your EC2 has jdk1.8 as default.
3. Create pipeline job which will clone and run Jenkinsfile 

## Monitoring
The AMI on which Jenkins is run has [Weave Scope](https://www.weave.works/products/weave-scope/) pre-installed. 
Scope is a Docker monitoring, visualisation and management tool from Weaveworks.
The Scope UI can be reached at the URL of the Jenkins instance on port 4040.
Example - http://"external-ip of your EC2 instance":4040

## Application
Here we are building [spring-petclinic](https://github.com/spring-projects/spring-petclinic) application.
Jenkins is running build for application. It creates docker image of it. After build it stops old image and deploys new image.
Application UI can be reached at port 9090. Example - http://"external-ip of your EC2 instance":9090 

