***
- #### Assignment  ####

  - #### DOCKERFILE Solutions ####

***
1. Create a file named index.js with below content.

    - var os = require("os"); var hostname = os.hostname(); console.log("hello from " + hostname);

      ```shell
      # vi index.js
      # cat index.js 
      var os = require("os"); var hostname = os.hostname(); console.log("Hello from " + hostname);
      ```

2. Create a file named Dockerfile and write code as per the steps mentioned.
- Use alpine image.
- Add Author/Maintainer name in DockerFile
- run commands -> apk update & apk add nodejs
- copy current directory to /app
- change your working directory to /app
- specify the default command to be run upon container creation as mentioned below. 

  - node index.js

   ```shell
  # vi Dockerfile
  # cat Dockerfile
  FROM alpine
  MAINTAINER Charukant 
  RUN apk update
  RUN apk add nodejs
  RUN mkdir -p /app
  COPY index.js /app
  WORKDIR /app
  CMD node index.js
   ```

3. Build image from Dockerfile:
   ``` shell
   # docker build -f Dockerfile .
   or 
   # docker build .
   Sending build context to Docker daemon  33.28kB
   Step 1/8 : FROM alpine AS myAlpine
    ---> 11cd0b38bc3c
   Step 2/8 : MAINTAINER Charukant
    ---> Running in ce05d92f2d07
   Removing intermediate container ce05d92f2d07
    ---> 05c9367abe9c
   Step 3/8 : RUN apk update
    ---> Running in 1cd55a62b1b8
   fetch http://dl-cdn.alpinelinux.org/alpine/v3.8/main/x86_64/APKINDEX.tar.gz
   fetch http://dl-cdn.alpinelinux.org/alpine/v3.8/community/x86_64/APKINDEX.tar.gz
   v3.8.0-24-g5355d992fa [http://dl-cdn.alpinelinux.org/alpine/v3.8/main]
   v3.8.0-18-g031849c018 [http://dl-cdn.alpinelinux.org/alpine/v3.8/community]
   OK: 9536 distinct packages available
   Removing intermediate container 1cd55a62b1b8
    ---> 3f348e0796ff
   Step 4/8 : RUN apk add nodejs
    ---> Running in 9d34d7669c4b
   (1/9) Installing ca-certificates (20171114-r3)
   (2/9) Installing c-ares (1.14.0-r0)
   (3/9) Installing libcrypto1.0 (1.0.2o-r2)
   (4/9) Installing libgcc (6.4.0-r8)
   (5/9) Installing http-parser (2.8.1-r0)
   (6/9) Installing libssl1.0 (1.0.2o-r2)
   (7/9) Installing libstdc++ (6.4.0-r8)
   (8/9) Installing libuv (1.20.2-r0)
   (9/9) Installing nodejs (8.11.3-r1)
   Executing busybox-1.28.4-r0.trigger
   Executing ca-certificates-20171114-r3.trigger
   OK: 30 MiB in 22 packages
   Removing intermediate container 9d34d7669c4b
    ---> 77e6b06ffaa9
   Step 5/8 : RUN mkdir -p /app
    ---> Running in f7598897d6e3
   Removing intermediate container f7598897d6e3
    ---> 48f20799ade4
   Step 6/8 : COPY index.js /app
    ---> 9f85f54340f5
   Step 7/8 : WORKDIR /app
   Removing intermediate container d7c80633666f
    ---> bff3b0dcd7e1
   Step 8/8 : CMD node index.js
    ---> Running in 7e9a5a6375df
   Removing intermediate container 7e9a5a6375df
    ---> 878cd8008adb
   Successfully built 878cd8008adb
   # docker images
   REPOSITORY          TAG                 IMAGE ID            CREATED              SIZE
   <none>              <none>              878cd8008adb        About a minute ago   32.5MB
   ```

4. Tag image with name "hello:v0.1":
   ```shell
   # docker build -t hello:v0.1 .
   # docker images
   REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
   hello               v0.1                878cd8008adb        4 minutes ago       32.5MB
   
   # docker run -i hello:v0.1
   Hello from 9c81526beca3
   ```

***
  - ####  Assignment 2 ####

      - ####  Solutions ####

***


1. Create a DockerFile.


   1. Use Ubuntu latest image.
   2. Add your name as a Manintainer.
   3. Update local packages using command (apt-get update).
   4. Install nodejs package.
   5. Install npm package.
   6. Create a symlink using command (ln -s /usr/bin/nodejs /usr/bin/node).
   7. Trigger a command (npm install -g http-server)
   8. Add any test index.html file from local at /usr/apps/hello-docker/index.html on container.
   9. change your working directory to /usr/apps/hello-docker/.
   10. Run a command (http-server -s) on every container initialization.
       ```shell
       # vi Dockerfile
       # cat Dockerfile
       FROM ubuntu 
       MAINTAINER Charukant 
       RUN apt-get update
       RUN apt-get install -y apt-utils
       RUN apt-get install nodejs -y  
       RUN apt-get install npm -y
       CMD ln -s /usr/bin/nodejs /usr/bin/node
       RUN npm install -g http-server
       COPY index.html /usr/apps/hello-docker/index.html
       WORKDIR /usr/apps/hello-docker/
       CMD http-server -s
       ```

11. Build your dockerfile and tag it with "yourname:docker-web"

    ```shell
    # docker build -t charukant:docker-web .
    ```

12. Run a docker container from the image that you have just created and map container 8080 port to host 8080 port.(8080:8080)

    ```shell
    # docker run -itdp 8080:8080 --name hellodocker 6e3
    ```

13. Try accessing your webpage using "http://<virtualmachine_ipaddress>:8080/index.html" URL.

    ```shell
    # docker ps
    # docker inspect 157 | grep "IPAddress"
    # curl localhost:8080
    <html>
    <body>
    <h1> Hello! Everyone. </h1>
    </body>
    </html>
    ```
    ![Hello Index.html](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/DKR-helloEv.png)

14. Delete docker container and image from local.

    ```shell
    #docker stop hellodocker
    #docker rm hellodocker
    #docker rmi charukant:docker-web
    ```