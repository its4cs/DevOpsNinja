1. ##### Task 1 Solution: ##### 

   1. ###### Created a VPC named Day1Task1 in Mumbai region using Web UI based wizard. ###### 

      ![VPC created using Web UI](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/AWS-vpc.png)

   2. ###### Created one public subnet named PublicSubnet1 and a private subnet named as PrivateSubnet1 in the VPC. ###### 

      ![Public and Private Subnet](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/AWS-subnets.png)

   3. ###### Created 2 Route Tables (PublicRouteTable & PrivateRouteTable) ###### 

      ![Route tables](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/AWS-RouteTables.png)

   4. ###### Created an Internet Gateway for Public Subnet (Ninja-IGW) ###### 

      ![IGW](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/AWS-igw.png)

   5. ###### Created 2 Security Groups ( SecurityGrpWin & SecurityGrpLin ) ###### 

      ![Security Groups](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/AWS-securityGrps.png)

2. ##### Task 2 Solution: ##### 

    1. ###### Created two Instances ( Amazon Linux & Windows Server 2012 R2)

       ![Route tables](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/AWS-instances.png)

    2. ###### Ping the instances from each other

       1. ###### Ping from Windows instance to Linux instance

          ![Route tables](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/AWS-pingWin2Lin.png)

       2. ###### Ping from Linux instance to Windows instance

          ![Route tables](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/AWS-pingLin2Win.png)

3. ##### Task 3 Solution: Delete the infra created so far and create the same infra using CLI ##### 

   1. 1. Used pip to install `AWS CLI` for linux on host machine.

         ```sh
             $ pip install awscli --upgrade --user
         
             $ aws -–version
         ```

         ![AWS CLI version check](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/AWS-CLI_version.png)

      2. Configured AWS CLI

         ```sh
         $ aws configure
         ```

         ![AWS CLI configuration](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/AWS-CLI-conf.png)

      3. Created a key-pair

         ```sh
         $ aws ec2 create-key-pair --key-name privatekey0 --query 'KeyMaterial' --output text > /root/privatekey0.pem
         ```

         ![Create key-pair in EC2](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/AWS-create-key-pair.png)

      4. Created a security group

         ```sh
         $ aws ec2 create-security-group --group-name securitygrp0 --description "Security Group for all instances" --vpc-id vpc-0320b8f322c0e5ce0
         ```

         ![EC2 Security Group](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/AWS-securitygrp.png)

      5. Created one public subnet named PublicSubnet1 and a private subnet named as PrivateSubnet1 in the VPC.

      6. Created 2 Route Tables (PublicRouteTable & PrivateRouteTable)

      7. Created an Internet Gateway for Public Subnet (Ninja-IGW)

   

   


