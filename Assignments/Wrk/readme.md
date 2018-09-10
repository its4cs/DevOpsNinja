***
- #### Assignment ####

	Use official shell script to install and configure Docker in a vagrant box.	

   1. Start Docker service and check status of the same.

   2. Enable Docker service to start at every machine reboot.

   3. Display Docker version.

2. Setup Java and Tomcat container.

3. Setup mySQL container.

4. Setup Elasticsearch container.
***
- #### Solution ####
   1. Official shell script for installing and configuring docker:

      - One step installation, used these command to setup docker:

        ```shell
        $ sudo su
        $ curl -fsSL https://get.docker.com/ | sh
        $ systemctl enable docker 
        $ systemctl start docker 
        $ systemctl status docker
        ```

      - Used this dockerfile for creating Java and Tomcat container

        - https://github.com/docker-library/tomcat/blob/eebf2f8b88db28cbeee79b7c6b1411401283c4bd/9.0/jre10-slim/Dockerfile

   2. Setup Java and Tomcat container.

      ```shell
      $ docker build .
      $ docker images
      $ docker run -itdp 8080:8080 --name jt 19a
      ```

      Check this URL in browser http://11.22.33.44:8080/, default tomcat page should appear.

   3. Setup mySQL container.

      ```shell
      $ docker build .
      $ docker images
      $ docker run -itdp 3306:3306 --name mysql dd1
      ```

      - Used this dockerfile for creating mySQL container:

   4. Setup mySQL container.

      ```shell
      $ docker build .
      $ docker images
      $ docker run -itdp 3306:3306 --name mysql dd1
      ```

      - Used this dockerfile for creating mySQL container:

   - https://github.com/docker-library/elasticsearch/blob/7e5d336cf3dc472756dd0e19c1d2cf62a011bcf4/5/alpine/Dockerfile

   5. docker composer file is required to be created for creating a final setup. More work is required.

- References:
   - https://hub.docker.com/r/stephenreed/jenkins-java8-maven-git/~/dockerfile/
   - https://hub.docker.com/_/elasticsearch/
