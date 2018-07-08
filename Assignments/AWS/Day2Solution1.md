1. ##### Task 1 Solution: ##### 

   1. ###### Manually created a VPC named Day2Task1. ######
       ![VPC created](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/AWS-manual_vpc.png) 

   2. ###### Created two each of the public, private and protected subnets for newly created VPC.

       ![Created 6 subnets](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/AWS-6subnets.png)

   3. ###### Created four Route Tables. ###### 

       Public Route Table attached to each of the Public Subnets created earlier.

       Protected Route Table attached to each Protected Subnets created earlier.

       Respective Private Route Table is attached to each Private Subnet.

       ![Route tables created](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/AWS-4routetables.png)

   4. ###### Created Internet Gateway named IGW-Day2Task1. ###### 

       ![IGW created](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/AWS-manual-igw.png)

   5. 

   6. ###### Created an Internet Gateway for Public Subnet (Ninja-IGW) ###### 

      ![IGW](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/AWS-igw.png)

   7. ###### Created 2 Security Groups ( SecurityGrpWin & SecurityGrpLin ) ###### 

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

         ![EC2 Security Group](https://github.com/its4cs/DevOpsNinja/blob/master/Assignm

         ents/images/AWS-securitygrp.png)

      5. Created Ubuntu instance for Private Subnet.

         ```sh
         $ aws ec2 run-instances --image-id ami-41e9c52e --security-group-ids sg-0d48fd959107e602b --subnet-id subnet-061ae63ac1edcd378 --instance-type t2.micro --placement AvailabilityZone=ap-south-1b --count 1
         ```

         Output

         ```
         {
             "Groups": [],
             "Instances": [
                 {
                     "AmiLaunchIndex": 0,
                     "ImageId": "ami-41e9c52e",
                     "InstanceId": "i-0f31b1161a13250f4",
                     "InstanceType": "t2.micro",
                     "LaunchTime": "2018-06-29T13:33:41.000Z",
                     "Monitoring": {
                         "State": "disabled"
                     },
                     "Placement": {
                         "AvailabilityZone": "ap-south-1b",
                         "GroupName": "",
                         "Tenancy": "default"
                     },
                     "PrivateDnsName": "ip-10-0-1-247.ap-south-1.compute.internal",
                     "PrivateIpAddress": "10.0.1.247",
                     "ProductCodes": [],
                     "PublicDnsName": "",
                     "State": {
                         "Code": 0,
                         "Name": "pending"
                     },
                     "StateTransitionReason": "",
                     "SubnetId": "subnet-061ae63ac1edcd378",
                     "VpcId": "vpc-0320b8f322c0e5ce0",
                     "Architecture": "x86_64",
                     "BlockDeviceMappings": [],
                     "ClientToken": "",
                     "EbsOptimized": false,
                     "Hypervisor": "xen",
                     "NetworkInterfaces": [
                         {
                             "Attachment": {
                                 "AttachTime": "2018-06-29T13:33:41.000Z",
                                 "AttachmentId": "eni-attach-08aace4e1125d5ca0",
                                 "DeleteOnTermination": true,
                                 "DeviceIndex": 0,
                                 "Status": "attaching"
                             },
                             "Description": "",
                             "Groups": [
                                 {
                                     "GroupName": "securitygrp0",
                                     "GroupId": "sg-0d48fd959107e602b"
                                 }
                             ],
                             "Ipv6Addresses": [],
                             "MacAddress": "0a:39:0e:f7:4f:c0",
                             "NetworkInterfaceId": "eni-076036586f2ff6b95",
                             "OwnerId": "075942873172",
                             "PrivateDnsName": "ip-10-0-1-247.ap-south-1.compute.internal",
                             "PrivateIpAddress": "10.0.1.247",
                             "PrivateIpAddresses": [
                                 {
                                     "Primary": true,
                                     "PrivateDnsName": "ip-10-0-1-247.ap-south-1.compute.internal",
                                     "PrivateIpAddress": "10.0.1.247"
                                 }
                             ],
                             "SourceDestCheck": true,
                             "Status": "in-use",
                             "SubnetId": "subnet-061ae63ac1edcd378",
                             "VpcId": "vpc-0320b8f322c0e5ce0"
                         }
                     ],
                     "RootDeviceName": "/dev/sda1",
                     "RootDeviceType": "ebs",
                     "SecurityGroups": [
                         {
                             "GroupName": "securitygrp0",
                             "GroupId": "sg-0d48fd959107e602b"
                         }
                     ],
                     "SourceDestCheck": true,
                     "StateReason": {
                         "Code": "pending",
                         "Message": "pending"
                     },
                     "VirtualizationType": "hvm"
                 }
             ],
             "OwnerId": "075942873172",
             "ReservationId": "r-076d430b9b82f200f"
         }
         ```

         

      6. Created Windows instance for Private Subnet.

         ```sh
         $ aws ec2 run-instances --image-id ami-5f95bd30 --security-group-ids sg-0d48fd959107e602b --subnet-id subnet-08dbefed5e741304b --instance-type t2.micro --placement AvailabilityZone=ap-south-1b --count 1
         ```

         

         ```
         {
             "Groups": [],
             "Instances": [
                 {
                     "AmiLaunchIndex": 0,
                     "ImageId": "ami-5f95bd30",
                     "InstanceId": "i-0d2cbc8e637b374c3",
                     "InstanceType": "t2.micro",
                     "LaunchTime": "2018-06-29T13:45:03.000Z",
                     "Monitoring": {
                         "State": "disabled"
                     },
                     "Placement": {
                         "AvailabilityZone": "ap-south-1b",
                         "GroupName": "",
                         "Tenancy": "default"
                     },
                     "Platform": "windows",
                     "PrivateDnsName": "ip-10-0-2-248.ap-south-1.compute.internal",
                     "PrivateIpAddress": "10.0.2.248",
                     "ProductCodes": [],
                     "PublicDnsName": "",
                     "State": {
                         "Code": 0,
                         "Name": "pending"
                     },
                     "StateTransitionReason": "",
                     "SubnetId": "subnet-08dbefed5e741304b",
                     "VpcId": "vpc-0320b8f322c0e5ce0",
                     "Architecture": "x86_64",
                     "BlockDeviceMappings": [],
                     "ClientToken": "",
                     "EbsOptimized": false,
                     "Hypervisor": "xen",
                     "NetworkInterfaces": [
                         {
                             "Attachment": {
                                 "AttachTime": "2018-06-29T13:45:03.000Z",
                                 "AttachmentId": "eni-attach-0b674b9dbd13a0fe1",
                                 "DeleteOnTermination": true,
                                 "DeviceIndex": 0,
                                 "Status": "attaching"
                             },
                             "Description": "",
                             "Groups": [
                                 {
                                     "GroupName": "securitygrp0",
                                     "GroupId": "sg-0d48fd959107e602b"
                                 }
                             ],
                             "Ipv6Addresses": [],
                             "MacAddress": "0a:17:c8:74:ad:9e",
                             "NetworkInterfaceId": "eni-09ec6dcd9762a8cba",
                             "OwnerId": "075942873172",
                             "PrivateDnsName": "ip-10-0-2-248.ap-south-1.compute.internal",
                             "PrivateIpAddress": "10.0.2.248",
                             "PrivateIpAddresses": [
                                 {
                                     "Primary": true,
                                     "PrivateDnsName": "ip-10-0-2-248.ap-south-1.compute.internal",
                                     "PrivateIpAddress": "10.0.2.248"
                                 }
                             ],
                             "SourceDestCheck": true,
                             "Status": "in-use",
                             "SubnetId": "subnet-08dbefed5e741304b",
                             "VpcId": "vpc-0320b8f322c0e5ce0"
                         }
                     ],
                     "RootDeviceName": "/dev/sda1",
                     "RootDeviceType": "ebs",
                     "SecurityGroups": [
                         {
                             "GroupName": "securitygrp0",
                             "GroupId": "sg-0d48fd959107e602b"
                         }
                     ],
                     "SourceDestCheck": true,
                     "StateReason": {
                         "Code": "pending",
                         "Message": "pending"
                     },
                     "VirtualizationType": "hvm"
                 }
             ],
             "OwnerId": "075942873172",
             "ReservationId": "r-0cd74e1045785d154"
         }
         ```

         ![AWS CLI Windows instance](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/AWS-CLI-instances.png)

