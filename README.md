# vpc-terraform
-This project is about creating a VPC (Virtual Private Cloud) inside AWS Cloud Space using a terraform tool.

-I first select the provider for terraform to work  with which in this case is aws so i set up that in the provider block as showen below

provider "aws" {

    profile= "aws"
  
  region = var.region
  
}



 
-This is project also describes the creation of an AWS EC2 instance resources  with all its component such as shown below

resource "aws_instance" "feyi_server" {

    ami         = var.ami
    
    instance_type = "t2.micro"
   
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
     
     tags = {
     
    Name = "aws_machine"
  }
}


-The project also touched on creating Ingress rules to allow 
port 22 for ssh connection to other servers  to be possible while 
port 80 to allow https all donje as part of the security group infrastructure using terraform.


-Also included in this project is the creation of a VPC(virtual private cloud)contains different Availability Zones  and inside each AZ we have public and private Subnets.One of the reasons for having different availability zones is that if one region is down the other region can automatically take over in this way we have guaranteed No down time, continuous availability of resources all within AWs infrastructures  

-The Public subnet is assoaicted with Route-table which males connecting to the internet Gateway possible.


-The public subnet and every web application in side it access internet through the Internet gateway
While the Private subnet house the Database servers and because of security issues that are not exposed or allowed to be expose to the outside world, the only way they have access because of update or upgrade is through Nat gateway
