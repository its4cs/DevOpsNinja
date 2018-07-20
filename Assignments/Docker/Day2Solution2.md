***
- #### Assignment 2 ####

1. Again pull "alpine" image from docker registry.
2. Take interactive login to bash while running docker container from "alpine" image.
3. Run command inside container: echo "hello world" > hello.txt ls.
4. Take exit from same container without killing the container.
5. Run another container using below command and check if you can find hello.txt within this container. You should find container isolations from step 3-5. docker container run alpine ls
6. Stop a container using Container ID.
7. Start same container using ID and exec a command "echo 'hello world!'" in docker container without instantiating a new container. 
8. Inspect already downloaded "alpine" docker image using docker inspect command.
9. Tag your local "alpine" image with name "myimage" along with version 1.0
***
- #### Solution ####
   1. Again pulled down the latest alpine image:

      ![alpine](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/DKR-reAlpine.png)

   2. Alpine BusyBox only provides sh and ash shells, so anyone of them can be used instead of bash:

      ``` shell
      $ docker run -it alpine sh
      $ docker run -it alpine ash
      ```

   3. Run command inside container: echo "hello world" > hello.txt ls.:

      ![os-release](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/DKR-hello-txt.png)

   4. Take exit from same container without killing the container.

      ```shell
      $ Ctl+p+q
      ```
      This key shortcut keeps the container running while exiting the shell.

   5. Run another container using below command and check if you can find hello.txt within this container. You should find container isolations from step 3-5. docker container run alpine ls:

      ```shell
      $ docker run -it  alpine ash
      # ls
      bin    dev    etc    home   lib    media  mnt    proc   root   run    sbin   srv    sys    tmp    usr    var
      
      ```

      There is no hello.txt, as it was expected.

   6. Stoped a container using Container ID.

      ![stop](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/DKR-stop.png)

   7. Start same container using ID and exec a command "echo 'hello world!'" in docker container without instantiating a new container.

      ![os-release](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/DKR-start-exec.png)

   8. Inspect already downloaded "alpine" docker image using docker inspect command.

      ```shell
      $ docker inspect alpine
      ```

   9. Tag your local "alpine" image with name "myimage" along with version 1.0

      ```
      $ docker tag alpine myimage:1.0
      ```

   ![os-release](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/DKR-tag.png)
