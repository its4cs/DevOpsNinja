***
- #### Assignment ####

1. Install docker-compose on your machine, if not already installed.
2. Check docker-compose version.
3. Create a directory named nginx in your root.
4. Switch to that directory and create a file named docker-compose.yaml
5. Use docker-compose version 2 to create docker-compose.yaml file.
6. Create a service named "databases".
7. Use image named "mysql"
8. Map container 3306 port to host machine 3306 port.
9. Add environment variables named "MYSQL_ROOT_PASSWORD", "MYSQL_DATABASE", "MYSQL_USER" and "MYSQL_PASSWORD" along with corresponding values for all.
10. Add another service named "web"
11. Use image "nginx"
12. Save docker-compose.yaml file and do docker-compose up.
13. Verify nginx service is up and is accessible on machine.
14. Stop and remove your docker container using docker-compose.

***
- #### docker-compose solutions: ####
   1. Docker Compose is already available:

      ```shell
      $ docker-compose --version
      docker-compose version 1.8.1, build 878cff1
      ```

      1. Commands for installing docker-compose are:

         ```shell
         $ sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
         $ sudo chmod +x /usr/local/bin/docker-compose
         ```

   2. Created a directory named nginx in root.

   3. Switched to that directory and created a file named docker-compose.yml

   4. Used docker-compose version 2 to create docker-compose.yaml file.

   5. Created a service named "databases".

   6. Used image named "mysql"

   7. Mapped container 3306 port to host machine 3306 port.

   8. Added environment variables named "MYSQL_ROOT_PASSWORD", "MYSQL_DATABASE", "MYSQL_USER" and "MYSQL_PASSWORD" along with corresponding values for all.

   9. Added another service named "web"

   10. Used image "nginx"

   11. Saved docker-compose.yaml file and did docker-compose up.
       ```shell
       $ sudo mkdir nginx
       $ cd nginx
       $ sudo vi docker-compose.yml
       $ cat docker-compose.yml
       version: '2'
       services:
         databases:
           image: mysql
           ports:
             - "3306:3306"
           env_file:
             - ens.env    
         web:
           image: nginx
           ports:
             - "80:80" 
           depends_on:
       - databases
       $ sudo vi ens.env
       $ cat ens.env
       MYSQL_ROOT_PASSWORD=redhat08
       MYSQL_DATABASE=nginxdb
       MYSQL_USER=root
       $ docker-compose up -d
       Creating network "nginx_default" with the default driver
       Pulling databases (mysql:latest)...
       latest: Pulling from library/mysql
       be8881be8156: Pull complete
       c3995dabd1d7: Pull complete
       9931fdda3586: Pull complete
       bb1b6b6eff6a: Pull complete
       a65f125fa718: Pull complete
       2d9f8dd09be2: Pull complete
       37b912cb2afe: Pull complete
       90a9e6fd6a27: Pull complete
       959ebd3ef120: Pull complete
       5eda665eddc4: Pull complete
       d9007173a367: Pull complete
       239f4d989075: Pull complete
       Digest: sha256:ffa442557c7a350939d9cd531f77d6cbb98e868aeb4a328289e0e5469101c20e
       Status: Downloaded newer image for mysql:latest
       Pulling web (nginx:latest)...
       latest: Pulling from library/nginx
       be8881be8156: Already exists
       32d9726baeef: Pull complete
       87e5e6f71297: Pull complete
       Digest: sha256:d85914d547a6c92faa39ce7058bd7529baacab7e0cd4255442b04577c4d1f424
       Status: Downloaded newer image for nginx:latest
       Creating nginx_databases_1
       Creating nginx_web_1
       ```

   12. Verify nginx service is up and is accessible on machine.

       ![nginx up](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/DKR-nginxup.png)

   13. Stoped and removed recent docker container using docker-compose.
       ```shell
       $ docker-compose down
       Stopping nginx_databases_1 ... done
       Removing nginx_web_1 ... done
       Removing nginx_databases_1 ... done
       Removing network nginx_default
       ```

