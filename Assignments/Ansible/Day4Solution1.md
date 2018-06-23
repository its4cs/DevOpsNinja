#### Create an Ansible playbook that targets members of the "app" group has the following state:  ####

1. The tomcat7 is installed in all host
2. Has the war file in webapps folder specified in `appwar`.
3. Tomcat is started on each host.

While developing the playbook use the `--syntax-check` to check your work and debug problems. Run your playbook in verbose mode using the `-v` switch to get more information on what Ansible is doing. Try `-vv` and `-vvv` for added verbosity. Also consider running `--check` to do a dry-run as you are developing



##### Playbook:

```
---
 - hosts: Debian
   remote_user: root
   become: yes
   become_method: sudo
   vars:
    Final: 'Tomcat8 has been installed'
   tasks:
   - name: Install Tomcat8
     apt:
       name: tomcat8
       state: present
   - name: Starting tomcat8.service
     service:
       name: tomcat8.service
       state: stopped
   - name: Copy war file to Tomcat webapps
     copy:
       src: /vagrant/
       dest: /usr/share/tomcat8/webapps/
   - name: Starting tomcat8.service
     service: 
       name: tomcat8.service 
       state: started
```
![Shell output](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/AnsibleDay4Assignment1-tomcatPlaybook.png)