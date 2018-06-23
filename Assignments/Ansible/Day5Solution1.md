| Topic          | Continuous integration and Continuous Deployment using Jenkins and Ansible |
| -------------- | ------------------------------------------------------------ |
| Assignment     |                                                              |
|                | All needs to be done using ansible modules with jenkins There will be three jenkins jobs, Provisioning, Build, Deployment. |
| Provisioning:- |                                                              |
|                | 1. Provision application servers, for example - java, tomcat are required for a java project. |
|                | 2. This job will be a separate job and can be executed to any machine on requirement. |
|                | ##### Build and Deployment Job will be in downstream relationship. |
| Build:-        |                                                              |
|                | Build any Project - can be java or any other language using jenkins. |
| Deployment:-   |                                                              |
|                | 1. Create a down stream deployment job to the build job .    |
|                | 2. In the deployment job , deploy the artifact (war in case of java) to the application server (tomcat/joboss) using ansible in the downstream job. |
|                | 3. Ansible play book will include health check also, (status code == 200) , if health check fails, job should also fail. |

1. ###### Provision new Ubuntu 16.04 node by playing a playbook:

   ```
   ---
   - name: "Install tomcat 8 one node"
     hosts: node3.ubuntu16
     become: true
     become_user: root
     gather_facts: true
     tasks:
   
      - name: "Add repository"
        apt_repository: 
          repo: ppa:webupd8team/java
          state: present
   
      - name: "updating"
        apt:
          update_cache: yes
   
      - name: Debian | Accept Oracle Java License
        debconf:
          name: "oracle-java8-installer"
          question: 'shared/accepted-oracle-license-v1-1'
          value: 'true'
          vtype: 'select'
   
      - name: "set Java 8 as your default Java version"
        apt:
          name: oracle-java8-set-default
          state: present
   
      - name: "set JAVA_HOME and JRE_HOME environment variables"
        lineinfile:
          path: /etc/environment
          line: "JAVA_HOME=/usr/lib/jvm/java-8-oracle"
          line: "JRE_HOME=/usr/lib/jvm/java-8-oracle/jre"
        
      - name: "Install tomcat8"
        apt: 
          name: tomcat8
          state: present
   
      - name: "Enable tomcat"
        service:
          name: tomcat8
          enabled: yes
   
      - name: "starting tomcat"
        service:
          name: tomcat8
          state: started
   ...
   ```
   ![Provision a new node](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/AnsibleDay5Assignment1-provision.png)

2. ######  :

   ```
   $ 
   ```

3. ##### :

   ```
   $ 
   ```

4. :

   ```
   
   ```
   ##### 

   Step 1:

   ```
       
   ```

   Step2:

   ```
    
   
   ```

   Step3:

   ```
      
   ```

   

   

   
