**ASSIGNMENT 2**

***Task 1*** :- How would you check:-
a) Memory used by a process (RAM)?
Ans- These five commands can be used to check memory used by a process :-
1. free 

2. top 

3. htop

4.  Total number of open files by a process?

  ```$ lsof -p (pid)```

5.  Running duration of a process?

   Get pid of a process

  ``` $ pidof Xorg```

   Get total execution time of the process

   Command syntex : ps -p {PID-HERE} -o etimes

  ```
   $ ps -p 3675 -o etimes
  
   $ ps -p 3675 -o pid,cmd,etime
  ```

***Task 2*** :- What is file descriptor?         

A file descriptor is a number that uniquely identifies an open file in a computer's operating system. It describes a data resource, and how that resource may be accessed.

 When a program asks to open a file — or another data resource, like a network socket — the kernel of the operating system grants access, makes an entry in the global file table, and provides the software with the location of that entry.

 The descriptor is identified by a unique non-negative integer, such as 0, 12, or 567. At least one file descriptor exists for every open file on the system.

 File descriptors were first used in Unix, and are used by modern operating systems including Linux, macOS X, and BSD. In Microsoft Windows, file descriptors are known as file handles.

***Task 3*** :- How to kill a process :-

1. 1. Forcefully:		kill -KILL pid , kill -SIGKILL pid	or 		kill -9 pid
   	. Gracefully:		kill -SIGHUP pid

 First Get pid of a process

```
 	$ pidof rhythmbox

 	$ kill -SIGHUP 28585

 	$ kill -9 28585
```

***Task 4*** :-  What are signals? 

Signals are software interrupts.  A robust program need to handle signals. This is because signals are a way to deliver asynchronous events to the application.

 A user hitting ctrl+c, a process sending a signal to kill another process etc are all such cases where a process needs to do signal handling.

 In Linux, every signal has a name that begins with characters SIG. For example :

- A SIGINT signal that is generated when a user presses ctrl+c. This is the way to terminate programs from terminal.

- A SIGALRM  is generated when the timer set by alarm function goes off.

- A SIGABRT signal is generated when a process calls the abort function.
- etc


***Task 5*** :- What is PPID?

1. A process can create child processes, so the process id of a parent 	process can be used to identify the child processes. One very important process is called INIT, it is the grandfather of all processes on the system because all other processes run under it. Every process can be tracked back to INIT & it always has a PID of 1. The kernel itself has a PID of 0.
   PPID 
   In addition to unique process ID, each processes is assigned a parent process ID (PPID) that tells which process started it. The PPID is the PID of the processes parent.
   For example:- If process 1 with a PID of 101 starts a processes named process 2, the process 2 will be given a unique PID, such as 3240, but it willl be given the PPID of 101.
   Its a parent-child relationship. A single parent process may severel child process, each with a unique PID but all sharing the same PPID.

Why is PPID important?
Occasionally process go bad, you might try to quit a program only to find that it has other intentions.
The process might continue to run or use up resources even though its interface closed.
Sometimes, this leads to what is called a zombie process, a processes that is still running, but dead.

One effective way to kill a zombie process is to kill its parent process. This involves using the PS command to discover the PPID of the zombie process and then sending a kill signal to the parents. Ofcourse, any other children of the parent process will be killed as well.

Pstree – It is a usefull program that shows the relationship of all processes in a tree like structure.

***Task 6*** :- How to print a PID of the current shell?

```
$ echo $$

 $ ps -p $$

To know the name of current shell  $ e**cho $SHELL 
```


***Task 7*** :- How to clear a log file of a running process?

Log 	rotation is the best solution for this but following few commands can also be used for this task:

1. 

  ```
  $ cat /dev/null > logfile
  
  	or
  
  $ true | tee logfile
  ```

2. Empty file content by redirecting to null
    A easiest way to empty or blank a file content using shell redirect null to the file
```
# du -sh access.log
# > access.log
```

2. Empty file using ‘true’ command redirection
    Here we will use a symbol : is a shell built-in command that is essence equilent to the ‘true’ command and it can be used as a no operation.
    Another method is to redirect the output of : or true built-in command.
```
# :> access.log
```

or
```
# true > assis.log
```

3. Empty file using cat/cp/dd utilities with /dev/null
    In Linux, the null device is basiclly utilized for discarding of unwanted output streams of a process or else as a suitable empty files for input streams.
    This is normally done by redirection mechainism.
```
# cat /dev/null > access.log
# cp /dev/null > access.log
# dd if=/dev/null of=access.log
```

4 Empty the file using echo command
```
# echo “ “  > access.log
```

or
```
# echo > acces.log
```

or
```
# echo -n “ ” > acces.log
```

5 Empty file using truncate command
The truncate command helps to shrink or extend the size of a file to a defined size.
You can employ it with the -s option that specifies the file size. To empty a file content, use a size of 0. 
```
# truncate -s 0 access.log
```


***Task 8*** :- What will happen if you delete a log file of running process?

1. The running program that was writing to log will keep on writing to the 	deleted file as the program will have the pid of that deleted file. If log file is deleted and log writing program is not restarted, it will disturbe the logging. So you don't lose your disk space permanently, but you don't gain anything by deleting the file and you lose access to new messages. 

***Task 9*** :- How do you check all the running process in the system?

``` 
$ 	ps -aux | less

or 

TOP command
```

***Task 10*** :-  How do you check those process that are waiting for the resources? 	

1. ```
   $ 	ps 	aux | awk '$8 ~ /D/  { print $0 }'
   
   $ 	while true; do date; ps auxf | awk '{if($8=="D") print 	$0;}'; sleep 1; done
   ```

***Task 11***:- What init process is responsible for?

1. The program init is the process with process ID 

2. 1. It is responsible for initializing the system in the required way. init is started directly by the kernel and resists signal 9, which normally kills processes.

***Task 12*** What are Running, Waiting, Stopped and Zombie processes?

 **Running** – here it’s either running (it is the current process in the system) or it’s ready to run (it’s waiting to be assigned to one of the CPUs).

 Waiting – in this state, a process is waiting for an event to occur or for a system resource. Additionally, the kernel also differentiates between two types of waiting processes; interruptible waiting processes – can be interrupted by signals and uninterruptible waiting processes – are waiting directly on hardware conditions and cannot be interrupted by any event/signal.

 **Stopped** – in this state, a process has been stopped, usually by receiving a signal. For instance, a process that is being debugged.

 **Zombie** – here, a process is dead, it has been halted but it’s still has an entry in the process table.

 Zombies are DEAD processes. They can not be 'kill' (You cannot kill the DEAD). All processes eventually die, and when they do they become zombies. They consume almost no resources, which is to be expected because they are dead! The reason for zombies is so the zombie's parent (process) can retrieve the zombie's exit status and resource usage statistics. The parent signals the operating system that it no longer needs the zombie by using one of the wait() system calls.

 When a process dies, its child processes all become children of process number 1, which is the init process. Init is ``always'' waiting for children to die, so that they don't remain as zombies.

**How 	do you elevate the priority of a process?**

 The process priority can be adjusted with the help of nice -n command.

 Increase the priority: $ nice -n -5 <process name>

 Decrease the priority: $ nice -n 5 <process name>	or	renice -n -19 -p <pid>

**What 	are stdin, stdout, and stderr and how do we use them?**

.  	Linux 	is built being able to run instructions from the command line using 	switches to create the output.

```
One of the ways to make use of this is by using the three special file 	descriptors - stdin, stdout and stderr.
```

1. 

	.  	 **How 	many tables are there in iptables. What filter and nat table 	responsible for?**

 IPTables has the following 4 built-in tables.

 \1. Filter Table

 Filter is default table for iptables. So, if you don’t define you own table, you’ll be using filter table. Iptables’s filter table has the following built-in chains.

 INPUT chain – Incoming to firewall. For packets coming to the local server.

 OUTPUT chain – Outgoing from firewall. For packets generated locally and going out of the local server.

 FORWARD chain – Packet for another NIC on the local server. For packets routed through the local server.

 \2. NAT table

 Iptable’s NAT table has the following built-in chains.

 PREROUTING chain – Alters packets before routing. i.e Packet translation happens immediately after the packet comes to the system (and before routing). This helps to translate the destination ip address of the packets to something that matches the routing on the local server. This is used for DNAT (destination NAT).

 POSTROUTING chain – Alters packets after routing. i.e Packet translation happens when the packets are leaving the system. This helps to translate the source ip address of the packets to something that might match the routing on the desintation server. This is used for SNAT (source NAT).

 OUTPUT chain – NAT for locally generated packets on the firewall.

 \3. Mangle table

 Iptables’s Mangle table is for specialized packet alteration. This alters QOS bits in the TCP header. Mangle table has the following built-in chains.

 PREROUTING chain

 OUTPUT chain

 FORWARD chain

 INPUT chain

 POSTROUTING chain

 \4. Raw table

 Iptable’s Raw table is for configuration excemptions. Raw table has the following built-in chains.

 PREROUTING chain

 OUTPUT chain

1. 

	.  	 **What 	are the default policies in iptables and What it signifies?**

3. 

4. 

	.  	 **What 	is the difference between -I and -A while applying a rule in 	iptables?**

6. 

7. 

	.  	 **What 	is the kernel module that tracks the connection block ssh and ftp 	access for vagrant1 machine to vagrant2 machine?**

9. 

10. 

	1.  	 **What 	is DNAT and SNAT, Explain both with an example?**

12. 

13. 

	4.  	 **Make 	a shell script that would configure a firewall as below:**

15. 1. 

    	.  		**Flush 		all the rules**

    3. 

    	.  		**set 		default DROP policy for INPUT, ACCEPT for FORWARD and OUTPUT chain 		of filter table**

    5. 

    	.  		**Allow 		ssh from vagrant machine1 only**

    7. 

    	.  		**Allow 		port 80,443 from everywhere**

    9. 

    	0.  		**Allow 		ping from outside**

    11. 

    	2.  		**Allow 		loopback Access**

    13. 

    	4.  		**Allow 		DNS**

    15. 

    	6.  		**Allow 		rsync from outside**

    17. 

    	8.  		**Allow 		postfix or sendmail**

16. 

	7.  	 **Write 	a rule that would prevent you from DDOS attack [HINT: 25 	connections/minute]**

18. 1. 1. 

       	.  			Similar 			to most of the popular RHEL/CentOS packages, Apache httpd can be 			installed in three different.

       3. 1. 

          	.  				Using 				**RPM**- using the following command  				

          	.  				*$ 				rpm –ivh httpd-2.4.x-1.i686.rpm*

          4. 

          	.  				Using 				**YUM**- run following command in CLI        				

          	.  				*$ 				yum install httpd*

          7. 

          	.  				Using 				**source package** - This process is a bit complex, first 				download source package, then extract it, compile it & then 				install it,

          	.  				*$ 				tar–xvf httpd-2.4.6.tar.gz*

       		  			   *$ 			cd httpd-2.2.26*

       		  			   *$./configure 			–prefix=PREFIX (here you will modify the apache installation)*

       		 1.  				*$ 				make*

          		  				*$ 				make install*

19. 

	0.  	**Q:** 	**Install and configure nginx - 	configure it to run as reverse proxy to apache**

		. 1.  		**Solution: 		Install nginx using following command**

    	. *$ 		yum install epel-release*

		.  	Extra 	Packages for Enterprise Linux (or EPEL) is a Fedora Special Interest 	Group that creates, maintains, and manages a high quality set of 	additional packages for Enterprise Linux.

		. 1. *$ 		yum install nginx*

		Enable and start Nginx service:

			*$ systemctl enable nginx*
	
			*$ systemctl start nginx*

		**Nginx server** **Configurations:**

		**Config dir – /etc/nginx/**

- 

	  	**Config 	dir – /etc/nginx/**

- 

	  	**Master/Global 	config file – /etc/nginx/nginx.conf**

- 

	  	**Port 	80 http config file – /etc/nginx/conf.d/default.conf**

- 

	  	**TCP 	ports opened by Nginx – 80 (HTTP), 443 (HTTPS)**

- 

	  	**Document 	root directory – /usr/share/nginx/html**

		Create a config file with the following command:
	
			*$ vim -lrt /etc/nginx/conf.d/default.conf*

 Add the following content:

  **\*server {***

​          **\*listen   80;***

​          **\*root /var/www/;***

​          **\*index index.php index.html index.htm;***

​          **\*server_name example.com;***

​          **\*location / {***

​                     **\*try_files $uri $uri/ /index.php;***

​          **\*}***

​                   **\*location ~ \.php$ {***

​                   **\*proxy_set_header X-Real-IP  $remote_addr;***

​                   **\*proxy_set_header X-Forwarded-For $remote_addr;***

​                   **\*proxy_set_header Host $host;***

​                   **\*proxy_pass http://127.0.0.1:8080;***

​          **\*}***

​          **\*location ~ /\.ht {***

​                   **\*deny all;***

​                                              **\*}***

​          **\*}***

 					    

 	**Save and close the file.**

1. 1. 

   	.  		Webpage 		should say 'Hi! I am DevOps Ninja.'

   	. Modify 		this file /usr/share/nginx/html/index.html to display required 		message "Hi! I am DevOps Ninja."

2. 

  .  	**Install 	and configure 'ntp' - with singapore time zone**

  . **Sol:** 	On the network, NTP server can be synchronized with an external 	timing source(Public NTP pool time service) to keep all the servers 	in your network in-sync with an accurate time.

  . To 	configure the NTP server the steps are:

  . ​		 	   1.) Install the package using yum command

  . ​			 	    *$yum 	install -y ntp*				  	

  . ​			2) 	Edit the ntp (/etc/ntp.conf) config file.

  	Before that, First Go to the Public NTP pool time service, refer the link (http://www.pool.ntp.org/en/). Click on the active servers from the Continent area on  right side of this page , Then search your country location from the zones and click on that (We are using Singapore time zone).
  	
  			Then, Open the /etc/ntp.conf file and add the comments of Public Servers from pool.ntp.org and replace it with the list provided for your country
  	
  	*$vim /etc/ntp.conf*
  	
  				  server 0.sg.pool.ntp.org   ibrust
  	
  				  server 1.sg.pool.ntp.org   ibrust
  	
  				  server 2.sg.pool.ntp.org   ibrust
  	
  				  server 3.sg.pool.ntp.org   ibrust


  ​				   

  				  You need to add the network range you allow to receive requests from your network to synchronize time with this server.(In our case we are using 192.168.1.0/24 network)

 *$* *restrict 192.168.1.0 netmask 255.255.255.0 nomodify notrap*

​				  here are some access control entries that are;

​    The nomodify options prevents any changes to the configuration.

​    The notrap option prevents ntpdc control message protocol traps.

​    The noquery option prevents ntpq and ntpdc queries, but not time queries, from being answered.

​    The nopeer option prevents a peer association being formed.

​	The Prefer option is specified that server is preferred over other servers.

​	

​	Allow ntp service on firewall of the server.

​	The Port of ntp service is 123/UDP. It is work on the transport layer. To allow the port on Centos7/RHEL7/Fedora22, following command used.

1. 

	.  	**Install 	Tomcat version 8 (a brief explaination about the directories in doc)**

	. **Sol:** 	Install Tomcat version 8

	. ​	 	 	

	. ​	 	Create a user called "tomcat" to own the Tomcat 	installation.

6. 

	. ​    	     *$ 	useradd tomcat*

	. ​    	 Install 	the JDK from the tarball under the tomcat user.

	. 1. 1. *$ 			yum install java-1.8.0-openjdk*

	0. ​    	 *$ 	su - tomcat*

		. ​    	  *$ 	tar -xzf /tmp/jdk-8u144-linux-x64.tar.gz*

		. ​    	  Install 	Tomcat from the tarball under the home directory of the "tomcat" 	user.

		. ​    	 *$ 	tar xzf /tmp/apache-tomcat-8.5.20.tar.gz*

		. Set 	the following environment variables and append them to the 	"/home/tomcat/.bash_profile" so they are set for 	subsequent logins.

15. 

	6. ​    	  *export 	JAVA_HOME=/home/tomcat/jdk1.8.0_144*

		. ​    	  *export 	CATALINA_HOME=/home/tomcat/apache-tomcat-8.5.20*

		. ​    	  *export 	CATALINA_BASE=$CATALINA_HOME*

19. 

	0. ​    	 Start 	and stop Tomcat using the following scripts.

21. 

	2. ​    	  *$ 	$CATALINA_HOME/bin/startup.sh*

		. ​    	  *$ 	$CATALINA_HOME/bin/shutdown.sh*

24. 

	5. The 	Tomcat logs are written to the "$CATALINA_HOME/logs/" 	directory by default.

26. 

	7. Once 	Tomcat is started, the following URL should be available. 	Configuration for the management URLs is discussed below.

28. 

	9. ​    	  http://localhost:8080/

		. ​    	  http://localhost:8080/manager/html

		. ​    	  http://localhost:8080/manager/status

32. 

	3. ​    	  Remember 	to open up the port on the firewall if you want to access the site 	from other servers on the network.

		. ​	 	 Information about the Linux firewall is available here.

		. ​    	Checking 	the Status of Tomcat

36. 

	7. ​    	 There 	are several ways to check the status of the service.

		. ​    	 *$ 	netstat -nlp | grep 8080*

		. ​    	 (Not 	all processes could be identified, non-owned process info

		. ​    	    will 	not be shown, you would have to be root to see it all.)

		. ​    	       tcp6 	      0      0 :::8080                 :::*                    	LISTEN      7564/java

		. ﻿ 	            *$ 	ps -ef | grep tomcat*

		. ​    	       oracle 	   7564     1 10 18:32 pts/0    00:00:15 /u01/jdk1.8.0_131/bin/java 	-Djava.util.logging.config.file=/u01/apache-tomcat-8.5.20/conf/logging.properties 	-Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager 	-Djdk.tls.ephemeralDHKeySize=2048 	-Djava.protocol.handler.pkgs=org.apache.catalina.webresources 	-classpath 	/u01/apache-tomcat-8.5.20/bin/bootstrap.jar:/u01/apache-tomcat-8.5.20/bin/tomcat-juli.jar 	-Dcatalina.base=/u01/apache-tomcat-8.5.20 	-Dcatalina.home=/u01/apache-tomcat-8.5.20 	-Djava.io.tmpdir=/u01/apache-tomcat-8.5.20/temp 	org.apache.catalina.startup. Bootstrap start

		. ​    	        oracle 	   7681  2645  0 18:35 pts/0    00:00:00 grep --color=auto tomcat

45. 

	6. ​    	             $ 	HTTP/1.1 200 OK

		. ​    	               HTTP/1.1 	200

		. ​    	               Content-Type: 	text/html;charset=UTF-8

		. ​    	               Transfer-Encoding: 	chunked

		. ​    	               Date: 	Thu, 24 May 2018 17:35:36 GMT

		. The 	status is also available from the HTML management page.

		. Configuration 	Files

		. The 	main locations of configuration and log information are shown below.

		. Release 	Notes        : $CATALINA_HOME

		. Config 	              : $CATALINA_HOME/conf

		. Bin 	Directory        : $CATALINA_HOME/bin

		. Webapps 	             : $CATALINA_HOME/webapps

		. Logs 	                : $CATALINA_HOME/logs

		. Enabling 	HTML Management Access

		. Edit 	the "$CATALINA_HOME/conf/tomcat-users.xml" file, adding 	the following entries inside "tomcat-users" tag. Adjust 	the password as required.

		. <role 	rolename="manager-gui"/>

		. <role 	rolename="admin-gui"/>

		. <user 	username="tomcat" password="MyPassw0rd!" 	roles="manager-gui,admin-gui"/>

		. Restart 	Tomcat for the configuration to take effect.

65. *$CATALINA_HOME/bin/shutdown.sh*

66. *$CATALINA_HOME/bin/startup.sh*

67. 

	8. The 	management application is now available from the 	﻿"http://localhost:8080/manager/html" 	URL.

		. Deploying 	Applications

70. 

	1. You 	can get a sample application WAR file to test with from 	"http://tomcat.apache.org/tomcat-8.0-doc/appdev/sample/".

		. If 	this is a redeployment, delete the existing deployment from the 	"$CATALINA_HOME/webapps" directory.

73. 

	4. *$ 	rm -Rf $CATALINA_HOME/webapps/sample*

75. 

	6. Place 	the "sample.war" file in the "$CATALINA_HOME/webapps" 	directory and Tomcat with automatically deploy it. You will see a 	"sample" directory appear. To stop and start Tomcat  	

77. *$CATALINA_HOME/bin/shutdown.sh*

78. *$CATALINA_HOME/bin/startup.sh*

79. 

	0.  	**Install 	java version 8 with home directory set as an environment variable**

81. 

	2.  	**Install 	'build essentials' (mention in doc that why do we need it)**

		**Sol:** It’s a tool for compiling and installing the packages which are not directly available for CentOS or any particular Linux distro. 'build essentials' is not directly available for CentOS it’s equivalant is “Development Tools”. Command for installation is this:

		*$ yum groupinstall 'Development Tools'*

1. 

	.  	Install 	logrotate and rotate tomcat's catalina.out log as:

	. *$ 	ls -lrt /var/log/*

	. *$ 	yum install logrotate*

5. 1. 

   	.  		Rotate 		the log file after 500kb

   3. 

   	.  		keep 		only last 5 files

Create a configration file fot monitoring tomcat logs

​	*$ vim /etc/logrotate.d/tomcat*

paste following into the file:

/opt/tomcat/logs/catalina.out /opt/tomcat/logs/*.logs {

​    missingok

​    copytruncate

​    rotate 5

​    size 500k

}

1. 

	.  	**Install 	git (a brief explaination about - what it is and why do we need it 	in doc)**

It most popular open source version control management software developed by Linus Torvalds. It is easy to start without any need to of a server, users don’t need to be connected to internet/network to use it.

1. 

	.  	**Q: 	After installing above check the respective logs if everything is 	installed and running (mention the log files name in doc)**

	. execute 	following  	

	. *$ 	which git		--* this 	will show the installation path

	. *$ 	git –version*	-- 	show installed current version

	.  	

7. 

	.  	 Also 	mention other files got created with software installation

	​	