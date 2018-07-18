***
- #### Assignment 1 ####

1. Run a docker container from "hello-world" image. 
2. Pull "alpine" image from docker registry and see if image is available in your local image list.
3. Pull some specific version of docker "alpine" image from docker registry. 
4. Run a docker container from local image "alpine" and run an inline command "ls -l" while running container. 
5. Try to take login to container created using "alpine" image. 
6. Detach yourself from the container without making it exit/container kill.
7. Check running containers and see if you can find out the stopped containers. 
8. Stop running container. 
9. Start container that was stopped earlier. 
10. Try to remove "alpine" image from your local system.
***
- #### Solution ####
   1. Following is the output of localy executed "hello-world" docker container.

      ![hello-world](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/DKR-helloWrld.png)

   2. Used these command to setup docker:

     ```shell
     $ docker pull alpine
     $ docker run alpine 
     $ docker images
     ```

     ![alpine image](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/DKR-alpineLatest.png)

   3. Pulled down alpine:3.6 from Docker registry:

      ![alpine:3.6](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/DKR-alpine:3.6.png)

   4. Run a docker container from local image "alpine" and run an inline command "ls -l" while running container.

      ![inline](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/DKR-inline.png)

   5. Loggedin to container that was created using "alpine" image:

      ```shell
      $ docker run alpine -it ash
      or if the container is already running in daemon mode, it can be utilised by it's name
      docker exec container_name -it ash i.e.
      $ docker exec -it zen_hawking ash
      ```

      ![ash](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/DKR-ash1.png)

      ![ash](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/DKR-ash2.png)

   6. For detaching from the container without making it exit/container kill, either start or exec the container using -itd options and exit either by exit or Ctl+p+q:
      ![detach](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/DKR-detach.png)

   7. List of all containers that were started during current Docker run:
      ![os-release](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/DKR-containerStatus.png)

   8. Stop running container.

      ```shell
      $ docker stop zen_hawking
      ```

   9. Start container that was stopped earlier. 

      ```shell
      $ docker start zen_hawking
      ```

   10. Try to remove "alpine" image from your local system. For this first remove all the containers if there are any and then remove the image, like this:

       ```shell
       $ docker rm $(sudo docker ps -aq)
       $ docker rmi alpine
       ```

       ![remove image](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/DKR-rmvImg.png)
   
