1. Used pip to install the `ansible` package and its dependencies to your control machine.

```
$sudo easy_install pip

$sudo pip install ansible

   Successfully installed MarkupSafe-1.0 PyYAML-3.12 ansible-2.5.4 asn1crypto-0.24.0 bcrypt-3.1.4 cffi-1.11.5 cryptography-2.2.2 enum34-1.1.6 idna-2.7 ipaddress-1.0.22 jinja2-2.10 paramiko-2.4.1 pyasn1-0.4.3 pycparser-2.18 pynacl-1.2.1 six-1.11.0
   /usr/lib/python2.7/site-packages/pip-10.0.1-py2.7.egg/pip/_vendor/urllib3/util/ssl_.py:137: InsecurePlatformWarning: A true SSLContext object is not available. This prevents urllib3 from configuring SSL appropriately and may cause certain SSL connections to fail. You can upgrade to a newer version of Python to solve this. For more information, see https://urllib3.readthedocs.io/en/latest/advanced-usage.html#ssl-warnings InsecurePlatformWarning
```

![pip Ansible install status](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/AnsibleDay1Assignment1-pipInstall.png)

2. Display the Ansible version and man page to STDOUT.

   ```
   $ ansible --version
   ansible 2.5.4
    config file = None
    configured module search path = [u'/home/vagrant/.ansible/plugins/modules', u'/usr/share/ansible/plugins/modules']
    ansible python module location = /usr/lib/python2.7/site-packages/ansible
    executable location = /usr/bin/ansible
    python version = 2.7.5 (default, Jun 17 2014, 18:11:42) [GCC 4.8.2 20140120 (Red Hat 4.8.2-16)]
   ```
   ![Ansible version](https://github.com/its4cs/DevOpsNinja/blob/master/Assignments/images/AnsibleDay1Assignment1-version.png)

2. Check all the possible parameters you need to know in ansible.cfg file.

```
#inventory      = /etc/ansible/hosts
#library        = /usr/share/my_modules/
#module_utils   = /usr/share/my_module_utils/
#remote_tmp     = ~/.ansible/tmp
#local_tmp      = ~/.ansible/tmp
#plugin_filters_cfg = /etc/ansible/plugin_filters.yml
#forks          = 5
#poll_interval  = 15
#sudo_user      = root
#ask_sudo_pass = True
#ask_pass      = True
#transport      = smart
#remote_port    = 22
#module_lang    = C
#module_set_locale = False
```

3. Ansible Inventory: Check the default inventory file for ansible control master and use inventory, run ansible ping commands on various inventory groups. Try this on minimum of two virtual machines. (You can use any of these Vagrant)

   ```
   cat /etc/ansible/hosts
   ```
Ansible master 192.168.30.9
[node1]
192.168.30.11
[node2]
192.168.30.10

4. In `~/.ansible.cfg` file (create the file if it doesn't exist already) do the following: Already available.
  * Create a new directory `~/.ansible/retry-files` and set `retry_files_save_path` to it.

    ```
    $ mkdir ~/.ansible/retry-files
    $ vi ~/.ansible.cfg
    ```
   Add following entries to the file:
   [defaults]

	retry_files_enabled = True
	retry_files_save_path = ~/.ansible/retry-files
	forks = 10

### Problem statement: Using Adhoc command

- Host a static website on minimum three hosts using inventory, content of static website is "Index page of Ansible assignment"
Document root /opt/html

- First do this manually and then with jenkins using ansible plugin or execute shell.
- only use ansible modules.

### There was no index file in /etc/ansible/ so created a file named: /etc/ansible/testIndex.html
```
$ ansible node1 -a "sudo yum install nginx -y"
$ ansible node2 -a "sudo yum install nginx -y"
$ ansible node3 -a "sudo yum install nginx -y"
$ ansible node1 -m copy -a "src=/etc/ansible/testIndex.html dest=/var/www/html/"
$ ansible node2 -m copy -a "src=/etc/ansible/testIndex.html dest=/var/www/html/"
$ ansible node3 -m copy -a "src=/etc/ansible/testIndex.html dest=/var/www/html/"
$ ansible node1 -a "sudo systemctl restart nginx"
$ ansible node2 -a "sudo systemctl restart nginx"
$ ansible node3 -a "sudo systemctl restart nginx"
```
 
```
$ ansible-playbook nginx.yml

```
