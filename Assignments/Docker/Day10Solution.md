***
- #### Assignment ####

1. Create a seperate docker network 'my-net' (bridge mode) and use it for below tasks.
2. Create docker image for Spring3HibernateApp
3. Dockerize Spring3HibernateApp via Docker CLI
   - Use created image for running container
   - Bind application to host machine port 80
   - Persist webapps volume
   - Restict memory utilization to 512M
   - Container should be removed if it gets into exited state
   - Run container in recently docker network 'my-net'
4. Dockerize Spring3HibernateApp via Docker Compose
   - Deploy service using created image
   - Use 'my-net' network
   - Bind host machine port 80
   - Instead of volume mount use data volume to persist webapps directory
5. Dockerize Spring3HibernateApp via Docker Swarm
   - Setup 1 manager and 2 worker nodes
   - Deploy Spring3HibernateApp stack using compose file
   - Replicate service to 3 containers

***
- #### Solution ####
   1. Created a seperate docker network 'my-net' in bridged mode:

      ```shell
      $ docker network create -d bridge my-net
      $ docker network ls
      NETWORK ID          NAME                DRIVER              SCOPE
      af513e75a305        bridge              bridge              local
      31229ccc781d        host                host                local
      3e7190d80f3d        my-net              bridge              local
      9aa913f425e8        none                null                local
      b7c729f51e45        wordpress_default   bridge              local
      
      ```

   2. Created a docker image for Spring3HibernateApp.

      ```shell
      $ cat Dockerfile 
      ###########################################################
      # Dockerfile to build Container for deploying Spring app  #
      ###########################################################
      
      FROM tomcat
      
      # File Author / Maintainer
      LABEL maintainer="Charukant"
      
      RUN apt-get update -y
      
      ADD Spring3HibernateApp.war /usr/local/tomcat/webapps/
      WORKDIR /usr/local/tomcat/webapps
      EXPOSE 8080
      
      $ docker build -t spring3app .
      ```

   3. Dockerized Spring3HibernateApp via Docker CLI

      - Used created image for running container
      - Binded application to host machine port 80
      - Persisted webapps volume
      - Resticedt memory utilization to 512M
      - Container should be removed if it gets into exited state
      - Run container in recently docker network 'my-net':
        ```shell
        # Following command will work on a local machine scenario
        $ docker run -itdp 80:8080 --name spring3hibernateapp -v springvol:/usr/local/tomcat/webapps --memory 512M --rm --network=my-net spring3app
        
        # Following command is required if docker is running inside vagrant
        $ docker run -itd --name spring3hibernateapp -v springvol:/usr/local/tomcat/webapps --memory 512M --network host spring3app
        
        ```

      ![Spring3 App](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/DKR-Spring3Hib.png)

   4. Dockerize Spring3HibernateApp via Docker Compose

      - Deploy service using created image

      - Use 'my-net' network

      - Bind host machine port 80

      - Instead of volume mount use data volume to persist webapps directory

         ```shell
         $ cat docker-compose.yml
         version: '3'
         services:
         spring3hibernateapp:
           build:
             context: .
             dockerfile: Dockerfile
           restart : on-failure
           ports:
              - 9000:8080
           volumes:
              - spring3app:/usr/local/tomcat/webapps/
           networks:
              - my-net
              
         $ docker-compose up -d
         Creating network "docker_my-net" with the default driver
         Creating volume "docker_spring3app" with default driver
         Building spring3hibernateapp
         Step 1/6 : FROM tomcat
          ---> 2d43521f2b1a
         Step 2/6 : LABEL maintainer "Charukant"
          ---> Using cache
          ---> 33e9653c7119
         Step 3/6 : RUN apt-get update -y
          ---> Using cache
          ---> 4b29cbead788
         Step 4/6 : ADD Spring3HibernateApp.war /usr/local/tomcat/webapps/
          ---> 46f531a9524a
         Removing intermediate container 05d33ac0750e
         Step 5/6 : WORKDIR /usr/local/tomcat/webapps
          ---> 3b3c8fc530e0
         Removing intermediate container bb1b47779c2c
         Step 6/6 : EXPOSE 8080
          ---> Running in 19fc957d2a28
          ---> 9efcad9fc2cd
         Removing intermediate container 19fc957d2a28
         Successfully built 9efcad9fc2cd
         WARNING: Image for service spring3hibernateapp was built because it did not already exist. To rebuild this image you must use `docker-compose build` or `docker-compose up --build`.
         Creating docker_spring3hibernateapp_1 ... done
         
         $ docker-compose images
                  Container                     Repository            Tag       Image Id      Size 
         ------------------------------------------------------------------------------------------
         docker_spring3hibernateapp_1   docker_spring3hibernateapp   latest   9efcad9fc2cd   477 MB
         
         ```


   5. Dockerized Spring3HibernateApp via Docker Swarm

      - Setup 1 manager and 2 worker nodes
      - Deploy Spring3HibernateApp stack using compose file
      - Replicate service to 3 containers

      

      ```shell
      $ docker swarm init --advertise-addr 10.20.30.40
      Swarm initialized: current node (ymn8vvmlrcoz3rrk3p3c90jww) is now a manager.
      
      To add a worker to this swarm, run the following command:
      
          docker swarm join \
          --token SWMTKN-1-1tdplldbhb99l37bl3ofeko8emtag6f5poykgb74jsfg2tzukm-d4mm0xgbjhbu34o6jgr29g50a \
          10.20.30.40:2377
      
      To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.
      
      ```


