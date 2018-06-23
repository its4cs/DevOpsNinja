#### Perform the following operations using ad-hoc commands and ansible modules :  ####

1. Create and delete ninja directory on host machine.

   ```
   $ ansible localhost -a "mkdir ninja"
   $ ansible localhost -a "rm -rf ninja"
   # Above commands are not recommended 
   # Following commands are using file module
   $ ansible localhost -m file -a "path=/tmp/ninja state=directory" -u vagrant
   $ ansible localhost -m file -a "path=/tmp/ninja state=directory" -u vagrant
   ```

2. Set hostname on all nodes from remote machine.
   ```
   $ ansible all -m hostname -a "name=test1"
   ```
   ![Change hostname for all nodes](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/AnsibleDay3Assignment1-changeHostname.png)

3. Fetch OS of all nodes and store o/p into a file, use min two different machine of different flavour of OS.

   ```
   $ ansible all -m setup -a 'gather_subset=virtual' | grep os_family > /tmp/os.txt
   ```
   ![Change hostname for all nodes](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/AnsibleDay3Assignment1-getOS.png)

4. Add three group into hosts file through ansible module.

   ```
   Debian ( ip of debian machine)
   Centos ( ip of centos machine)
   All ( ip of all nodes )
   
   $ ansible localhost -m lineinfile -u root -a "path=/etc/ansible/hosts line=[Debian]\n192.168.30.22\n[Centos]\n192.168.30.11\n[All]\n192.168.30.11\n192.168.30.22"
   ```
   ##### Problem statement: Using Adhoc command

   Step 1:

   ```
       * Install apache on Debian machine
   $ ansible Debian -m apt -u root -a “name=apache2 state=present”
   
       * Cross check apache isntalled or not from remote machine
   $ ansible Debian -a "sudo systemctl status apache2"
   ![Change hostname for all nodes](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/AnsibleDay3Assignment1-apache2Present.png)
       * Apache run  on 8082 port
   $ ansible Debian -m lineinfile -u root -a "path=/etc/apache2/ports.conf state=present regexp='Listen 80' line='Listen 8082'"
   
   192.168.30.22 | SUCCESS => {
       "backup": "", 
       "changed": true, 
       "msg": "line replaced"
   }
   
       * Create two virtual host
   $ 
       
       * Restart apache from remote machine
   $ ansible Debian -a "sudo systemctl restart apache2"
       
   ```

   Step2:

   ```
      * Install nginx on centos machine
   $ ansible Centos -m yum -u root -a "name=nginx state=present"
      
      * Nginx run on 8080 port.
   $ ansible Centos -m lineinfile -a "path=/etc/nginx/nginx.conf regexp='^(.)listen 80 default_server;(.)$' line='listen 8080 default_server; '"
   
   ```

   Step3:

   ```
      * Configure Nginx - configure it to run as reverse proxy to apache
   ```

   

   

   
