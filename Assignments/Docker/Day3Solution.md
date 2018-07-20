***
- #### Assignment 1  ####

  - #### Docker Port Solutions ####

***
1. Pull nginx image from dockerhub

   ```shell
   # docker pull nginx
   Using default tag: latest
   latest: Pulling from library/nginx
   be8881be8156: Pull complete 
   f2f27ed9664f: Pull complete 
   54ff137eb1b2: Pull complete 
   Digest: sha256:4a5573037f358b6cdfa2f3e8a9c33a5cf11bcd1675ca72ca76fbe5bd77d0d682
   Status: Downloaded newer image for nginx:latest
   ```

2. Run a container from nginx image and map container port 80 to system port 80.

   ```shell
   # docker run -itdp 80:80 nginx
   ```

3. Display all mapped ports on nginx image:

   ``` shell
   # docker ps
   CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                NAMES
   fc1355bd1286        nginx               "nginx -g 'daemon of…"   6 minutes ago       Up 6 minutes        0.0.0.0:80->80/tcp   nifty_turing
   cf6e286889ba        alpine              "ash"                    About an hour ago   Up About an hour                         objective_benz
   8eef5267033a        alpine              "sh"                     About an hour ago   Up 43 minutes                            lucid_archimedes
   [root@docker vagrant]# docker container port fc1355bd1286
   80/tcp -> 0.0.0.0:80
   ```

4. Run a docker container named "containexpose" from nginx image and expose port 80 of container to outer world without mapping it to any of system port.:
   ```shell
   # docker run -itd --network host --name containexpose nginx bash
   # netstat -tulpn | grep :80
   tcp6       0      0 :::80                   :::*                    LISTEN      4425/docker-proxy 
   ```
***
  -   - #### Docker Port Solutions ####

***


1. Create docker volume named "dbvol"

   ```shell
   # docker volume create dbvol
   # docker volume ls
   DRIVER              VOLUME NAME
   local               dbvol
   
   ```

2. Run docker container from wordpress image and mount "dbvol" to /var/lib/mysql.

   ```shell
   # docker run -it --name wordpress -v dbvol:/var/lib/mysql wordpress bash
   ```

3. Display all docker volumes.
   ```shell
   # docker volume ls
   DRIVER              VOLUME NAME
   local               5e911104838b2f26572b61e521ea5ae41ca9edb9c3ff98a9c328ab151e415e1a
   local               dbvol
   ```

4. Create another docker volume named "testvol"
   ```shell
   # docker volume create testvol
   # docker volume ls
   DRIVER              VOLUME NAME
   local               5e911104838b2f26572b61e521ea5ae41ca9edb9c3ff98a9c328ab151e415e1a
   local               dbvol
   local               testvol
   
   ```
5. Remove docker volume "testvol"
   ```shell
   # docker volume rm testvol
   # docker volume ls
   DRIVER              VOLUME NAME
   local               5e911104838b2f26572b61e521ea5ae41ca9edb9c3ff98a9c328ab151e415e1a
   local               dbvol
   ```
***
  -   - #### Docker Linking Solutions ####

***
1. Run a container in detached mode with name "db" from image "training/postgres"
   ```shell
   # docker pull training/postgres
   # docker run -itd --name db training/postgres
   # docker ps
   CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                NAMES
   d37b2035ad8e        training/postgres   "su postgres -c '/us…"   5 seconds ago       Up 4 seconds        5432/tcp             db
   ```

2. Run another container in detached mode with name "web" from image "training/webapp", link container "db" with alias "mydb" to this container and finally pass an inline command "python app.py" while running container.
   ```shell
   # docker run -itd --name web --link db:mydb training/webapp python app.py
   # docker ps
   CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                NAMES
   5c3a032713a5        training/webapp     "python app.py"          16 seconds ago      Up 14 seconds       5000/tcp             web
   
   ```

3. Take a bash terminal in "web" container.

   ```shell
   # docker exec -it 5c3 bash
   ```

4. Test container linking by doing a ping to "mydb".
   ```shell
   root@5c3a032713a5:/opt/webapp# ping mydb
   PING mydb (172.17.0.5) 56(84) bytes of data.
   64 bytes from mydb (172.17.0.5): icmp_seq=1 ttl=64 time=0.130 ms
   64 bytes from mydb (172.17.0.5): icmp_seq=2 ttl=64 time=0.045 ms
   ```