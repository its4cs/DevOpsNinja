***
- #### Assignment 1 ####

1. Signup on dockerhub.
2. Login on dockerhub and create a repository by providing repo name "mytestrepo" and a little description about the same.
3. Search for "centos" image on docker using commandline.
4. Limit out search result to 10 entries only.
5. Apply a filter on search result to show entries for images having 3 stars.
6. Format the search result to get output containing only name,description and is_official values.
7. Pull an image named "centos" from dockerhub.
8. Tag "centos" image with name "mycentos" in your repository with version 1.1.
9. Push that image to your repo "mytestrepo" on your dockerhub.
10. Do commandline logout on dockerhub.
***
- #### Solution ####
   1. Registered on Docker Hub:

      ![dockerhub](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/DKR-dockerhub.png)

   2. A dockerhub repository created with "mytestrepo" name:

      ![dockerhub repo](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/DKR-dockerhub-repo.png)

   3. Search for "centos" image on docker using commandline.

   4. Limit out search result to 10 entries only.:
      ```shell
      $ docker search centos --limit 10
      NAME                          DESCRIPTION                                     STARS               OFFICIAL            AUTOMATED
      centos                        The official build of CentOS.                   4419                [OK]                
      ansible/centos7-ansible       Ansible on Centos7                              114                                     [OK]
      jdeathe/centos-ssh            CentOS-6 6.9 x86_64 / CentOS-7 7.4.1708 x86_…   97                                      [OK]
      openshift/base-centos7        A Centos7 derived base image for Source-To-I…   28                                      
      kinogmt/centos-ssh            CentOS with SSH                                 21                                      [OK]
      openshift/jenkins-2-centos7   A Centos7 based Jenkins v2.x image for use w…   13                                      
      pivotaldata/centos-gpdb-dev   CentOS image for GPDB development. Tag names…   5                                       
      pivotaldata/centos            Base centos, freshened up a little with a Do…   2                                       
      pivotaldata/centos-mingw      Using the mingw toolchain to cross-compile t…   1                                       
      smartentry/centos             centos with smartentry                          0                                       [OK]
      ```

   5. Apply a filter on search result to show entries for images having 3 stars:

      ```shell
      $ docker search centos -f stars=3
      NAME                              DESCRIPTION                                     STARS               OFFICIAL            AUTOMATED
      centos                            The official build of CentOS.                   4419                [OK]                
      ansible/centos7-ansible           Ansible on Centos7                              114                                     [OK]
      jdeathe/centos-ssh                CentOS-6 6.9 x86_64 / CentOS-7 7.4.1708 x86_…   97                                      [OK]
      consol/centos-xfce-vnc            Centos container with "headless" VNC session…   57                                      [OK]
      tutum/centos                      Simple CentOS docker image with SSH access      43                                      
      imagine10255/centos6-lnmp-php56   centos6-lnmp-php56                              43                                      [OK]
      gluster/gluster-centos            Official GlusterFS Image [ CentOS-7 +  Glust…   32                                      [OK]
      centos/mysql-57-centos7           MySQL 5.7 SQL database server                   31                                      
      openshift/base-centos7            A Centos7 derived base image for Source-To-I…   28                                      
      centos/python-35-centos7          Platform for building and running Python 3.5…   26                                      
      centos/postgresql-96-centos7      PostgreSQL is an advanced Object-Relational …   22                                      
      kinogmt/centos-ssh                CentOS with SSH                                 21                                      [OK]
      openshift/jenkins-2-centos7       A Centos7 based Jenkins v2.x image for use w…   13                                      
      openshift/mysql-55-centos7        DEPRECATED: A Centos7 based MySQL v5.5 image…   6                                       
      pivotaldata/centos-gpdb-dev       CentOS image for GPDB development. Tag names…   5                                       
      openshift/jenkins-1-centos7       DEPRECATED: A Centos7 based Jenkins v1.x ima…   4                                       
      darksheer/centos                  Base Centos Image -- Updated hourly             3                                       [OK]
      openshift/wildfly-101-centos7     A Centos7 based WildFly v10.1 image for use …   3                                       
      ```

   6. Format the search result to get output containing only name,description and is_official values:

      ```shell
      $ docker search centos --format "{{.Name}}: {{.Description}}: {{.IsOfficial}}" --limit 10
      centos: The official build of CentOS.: [OK]
      ansible/centos7-ansible: Ansible on Centos7: 
      jdeathe/centos-ssh: CentOS-6 6.9 x86_64 / CentOS-7 7.4.1708 x86_…: 
      openshift/base-centos7: A Centos7 derived base image for Source-To-I…: 
      kinogmt/centos-ssh: CentOS with SSH: 
      openshift/jenkins-2-centos7: A Centos7 based Jenkins v2.x image for use w…: 
      pivotaldata/centos-gpdb-dev: CentOS image for GPDB development. Tag names…: 
      pivotaldata/centos: Base centos, freshened up a little with a Do…: 
      pivotaldata/centos-mingw: Using the mingw toolchain to cross-compile t…: 
      smartentry/centos: centos with smartentry: 
      ```

   7. Pull an image named "centos" from dockerhub:

      ```shell
      $ docker pull centos:7
      ```

   8. Tag "centos" image with name "mycentos" in your repository with version 1.1.

      ```shell
      $ docker image tag centos:7 charukant/mycentos:v1.1
      ```

   9. Pushed this image to my repo "mytestrepo" on dockerhub.

      ```shell
      $ docker login
      Login with your Docker ID to push and pull images from Docker Hub. If you don't have a Docker ID, head over to https://hub.docker.com to create one.
      Username: charukant
      Password: 
      WARNING! Your password will be stored unencrypted in /root/.docker/config.json.
      Configure a credential helper to remove this warning. See
      https://docs.docker.com/engine/reference/commandline/login/#credentials-store
      
      Login Succeeded
      
      $ docker image tag centos:7 charukant/mycentos:v1.1
      $ docker push charukant/mycentos:v1.1
      The push refers to repository [docker.io/charukant/mycentos]
      bcc97fbfc9e1: Pushed 
      v1.1: digest: sha256:eed5b251b615d1e70b10bcec578d64e8aa839d2785c2ffd5424e472818c42755 size: 529
      
      # Tried few other options
      $ docker push charukant/mytestrepo
      The push refers to repository [docker.io/charukant/mytestrepo]
      bcc97fbfc9e1: Mounted from charukant/mycentos 
      latest: digest: sha256:eed5b251b615d1e70b10bcec578d64e8aa839d2785c2ffd5424e472818c42755 size: 529
      $ docker image tag mycentos:v1.1 charukant/mytestrepo:v0.1
      $ docker push charukant/mytestrepo:v0.1
      The push refers to repository [docker.io/charukant/mytestrepo]
      bcc97fbfc9e1: Layer already exists 
      v0.1: digest: sha256:eed5b251b615d1e70b10bcec578d64e8aa839d2785c2ffd5424e472818c42755 size: 529
      ```

   10. Loggedout on commandline from dockerhub.

       ```shell
       $ docker logout
       Removing login credentials for https://index.docker.io/v1/
       ```

