***
- #### Assignment ####

1. Install docker-compose on your machine, if not already installed.
2. Create a directory named wordpress on your local.
3. switch to that directory and create a file named docker-compose.yaml
4. Use docker-compose version 2 to create docker-compose.yaml file.
5. Create a service named "wordpress" using wordpress:latest image.
6. Map port of wordpress container port 80 to host system port 8000.
7. Add a parameter to restart container in case service went down.
8. Within wordpress environment variable, add wordpress_db_host value along with port.
9. Also add one more variable named wordpress_db_password.
10. Add a volume named wordpress_data.

*Add one more service named "db" under same docker-compose file.

- Use image named mysql with version 5.7
- Use volume wordpress_data and map it to /var/lib/mysql
- Enable always restart parameter.
- Add environment variables named "MYSQL_ROOT_PASSWORD", "MYSQL_DATABASE", "MYSQL_USER" and "MYSQL_PASSWORD" along with corresponding values for all.
- At last add a dependency of db service in wordpress service.
- save the file and build docker-compose.yaml and create containers for wordpress and db machine.
- Display currently bulit containers created using docker-compose.
- Stop and remove your docker container using docker-compose.

***
- #### More docker-compose solutions: ####
   1. Docker Compose is already available:

      ```shell
      $ docker-compose --version
      docker-compose version 1.8.1, build 878cff1
      ```

   2. Created a directory named wordpress on local.

   3. Switched to that directory and created a file named docker-compose.yaml

   4. Use docker-compose version 2 to create docker-compose yaml file.

   5. Created a service named "wordpress" using wordpress:latest image.

   6. Mapped port of wordpress container port 80 to host system port 8000.

   7. Added a parameter to restart container in case service went down.

   8. Within wordpress environment variable, added wordpress_db_host value along with port.

   9. Also add one more variable named wordpress_db_password.

   10. Add a volume named wordpress_data.

   *Add one more service named "db" under same docker-compose file.

   - Use image named mysql with version 5.7
   - Use volume wordpress_data and map it to /var/lib/mysql
   - Enable always restart parameter.
   - Add environment variables named "MYSQL_ROOT_PASSWORD", "MYSQL_DATABASE", "MYSQL_USER" and "MYSQL_PASSWORD" along with corresponding values for all.
   - At last add a dependency of db service in wordpress service.
   - save the file and build docker-compose.yaml and create containers for wordpress and db machine.

   1. Saved docker-compose.yaml file and did docker-compose up.
      ```shell
      $ sudo mkdir wordpress
      $ cd wordpress
      $ sudo vi docker-compose.yml
      $ cat docker-compose.yml
      version: '2'
      services:
        wordpress:
          image: wordpress:latest
          ports:
            - "8000:80"
          restart: on-failure
          environment:
            WORDPRESS_DB_HOST: db:3306
            WORDPRESS_DB_PASSWORD: redhat08
          volumes:
            - WORDPRESS_DATA:/var/lib/wordpress
          depends_on:
            - db
        db:
          image: mysql:5.7
          volumes:
            - MYSQL_DATA:/var/lib/mysql
          restart: always
          environment:
            MYSQL_ROOT_PASSWORD: redhat08
            MYSQL_DATABASE: db
            MYSQL_USER: root
      #      MYSQL_PASSWORD: redhat08
      
      volumes:
        WORDPRESS_DATA:
      $ docker-compose up -dCreating network "wordpress_default" with the default driver
      Creating volume "wordpress_MYSQL_DATA" with default driver
      Creating volume "wordpress_WORDPRESS_DATA" with default driver
      Pulling db (mysql:5.7)...
      5.7: Pulling from library/mysql
      be8881be8156: Already exists
      c3995dabd1d7: Already exists
      9931fdda3586: Already exists
      bb1b6b6eff6a: Already exists
      a65f125fa718: Already exists
      2d9f8dd09be2: Already exists
      37b912cb2afe: Already exists
      79592d21cb7f: Pull complete
      b2c40cef4807: Pull complete
      f3507e55e5eb: Pull complete
      e6006cdfa16b: Pull complete
      a3ed406e3c88: Pull complete
      745f1366071d: Pull complete
      bdfcada64ad8: Pull complete
      86f2b695cc77: Pull complete
      5f634a03970a: Pull complete
      a329a7ebde19: Pull complete
      fb3d2649f534: Pull complete
      8fa928654124: Pull complete
      a925e4a45888: Pull complete
      b5e827c13dc3: Pull complete
      980d732311db: Pull complete
      f1f668bf66de: Pull complete
      Digest: sha256:7f8aa332e6c905d1cb6efc6632801e4c6b52d9a91e41a25a1de7668fb6f1a6da
      Status: Downloaded newer image for wordpress:latest
      Creating wordpress_db_1
      Creating wordpress_wordpress_1
      ```

   2. List of currently bulit containers created using docker-compose:

      ```shell
      $ docker-compose ps
              Name                       Command               State          Ports         
      -------------------------------------------------------------------------------------
      wordpress_db_1          docker-entrypoint.sh mysqld      Up      3306/tcp             
      wordpress_wordpress_1   docker-entrypoint.sh apach ...   Up      0.0.0.0:8000->80/tcp
      ```

   3. Wordpress setup steps:

      ![wordpress 1](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/DKR-wp1.png)

      ![wordpress 2](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/DKR-wp2.png)

      ![wordpress 3](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/DKR-wp3.png)

      ![wordpress Dashboard](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/DKR-wp4.png)

   4. Stoped and removed recent docker container using docker-compose.
      ```shell
      $ docker-compose stop
      Stopping wordpress_wordpress_1 ... done
      Stopping wordpress_db_1 ... done
      $ docker-compose rm -f
      Going to remove wordpress_wordpress_1, wordpress_db_1
      Removing wordpress_wordpress_1 ... done
      Removing wordpress_db_1 ... done
      ```
