***
- #### Assignment ####

1. Use official shell script to install and configure Docker on your control machine.

2. Start Docker service and check status of the same.

3. Enable Docker service to start at every machine reboot.

4. Display Docker version.

5. Configure non root user to run docker commands without sudo.

6. Type docker on commandline and read output i.e containing related commands.

7. Display System information using Docker.

8. Check whether you can access/download images from DockerHub or not.
***
- #### Solution ####
   1. Official shell script for installing and configuring docker:

      - My control machine meets the prerequisits for installing docker-ce.

        ![os-release](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/DKR-os-release.png)

      - Used these command to setup docker:

        ```shell
        $ curl -fsSL get.docker.com -o get-docker.sh
        $ chmod 500 get-docker.sh 
        $ ./get-docker.sh
        ```

      - Docker installation completed:
        ![os-release](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/DKR-version.png)

   2. Start Docker service and check status:

      ![os-release](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/DKR-service-status.png)

   3. Enable Docker service to start at every machine reboot.

      ![os-release](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/DKR-startWthOS.png)

   4. Display Docker version:

      ![os-release](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/DKR-ver.png)

   5. Configure non root user to run docker commands without sudo.

      ```shell
      $ usermod -aG docker charukant
      ```

   6. Type docker on commandline and read output i.e containing related commands:
      ![os-release](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/DKR-cmd.png)

   7. Display System information using Docker.
      ![os-release](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/DKR-info.png)

   8. Checked for access/download images from DockerHub:

      Tried running default hello-world image, it worked fine.

      ![os-release](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/DKR-helloWrld.png)

   
