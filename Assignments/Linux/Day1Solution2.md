**Steps involved in completing the assignment:**

1. 

2.  	**Q: 	Install and configure apache/httpd**

3. 1. 

   2.  		**Sol: 		Apache httpd installation steps:**

   3. 1. 

      2.  			Similar 			to most of the popular RHEL/CentOS packages, Apache httpd can be 			installed in three different.

      3. 1. 

         2.  				Using 				**RPM**- using the following command  				

         3.  				*$ 				rpm –ivh httpd-2.4.x-1.i686.rpm*

         4. 

         5.  				Using 				**YUM**- run following command in CLI        				

         6.  				*$ 				yum install httpd*

         7. 

         8.  				Using 				**source package** - This process is a bit complex, first 				download source package, then extract it, compile it & then 				install it,

         9.  				*$ 				tar–xvf httpd-2.4.6.tar.gz*

      4.  			   *$ 			cd httpd-2.2.26*

      5.  			   *$./configure 			–prefix=PREFIX (here you will modify the apache installation)*

      6. 1.  				*$ 				make*

         2.  				*$ 				make install*

4. 

5.  	**Q:** 	**Install and configure nginx - 	configure it to run as reverse proxy to apache**

6. 1.  		**Solution: 		Install nginx using following command**

   2. *$ 		yum install epel-release*

7.  	Extra 	Packages for Enterprise Linux (or EPEL) is a Fedora Special Interest 	Group that creates, maintains, and manages a high quality set of 	additional packages for Enterprise Linux.

8. 1. *$ 		yum install nginx*

 	Enable and start Nginx service:

 		*$ systemctl enable nginx*

​		*$ systemctl start nginx*

 	**Nginx server** **Configurations:**

 	**Config dir – /etc/nginx/**

- 

-  	**Config 	dir – /etc/nginx/**

- 

-  	**Master/Global 	config file – /etc/nginx/nginx.conf**

- 

-  	**Port 	80 http config file – /etc/nginx/conf.d/default.conf**

- 

-  	**TCP 	ports opened by Nginx – 80 (HTTP), 443 (HTTPS)**

- 

-  	**Document 	root directory – /usr/share/nginx/html**

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

   2.  		Webpage 		should say 'Hi! I am DevOps Ninja.'

   3. Modify 		this file /usr/share/nginx/html/index.html to display required 		message "Hi! I am DevOps Ninja."

2. 

3.  	**Install 	and configure 'ntp' - with singapore time zone**

4. **Sol:** 	On the network, NTP server can be synchronized with an external 	timing source(Public NTP pool time service) to keep all the servers 	in your network in-sync with an accurate time.

5. To 	configure the NTP server the steps are:

6. ​		 	   1.) Install the package using yum command

7. ​			 	    *$yum 	install -y ntp*				  	

8. ​			2) 	Edit the ntp (/etc/ntp.conf) config file.

​	Before that, First Go to the Public NTP pool time service, refer the link (http://www.pool.ntp.org/en/). Click on the active servers from the Continent area on  right side of this page , Then search your country location from the zones and click on that (We are using Singapore time zone).

​			Then, Open the /etc/ntp.conf file and add the comments of Public Servers from pool.ntp.org and replace it with the list provided for your country

​	*$vim /etc/ntp.conf*

​				  server 0.sg.pool.ntp.org   ibrust

​				  server 1.sg.pool.ntp.org   ibrust

​				  server 2.sg.pool.ntp.org   ibrust

​				  server 3.sg.pool.ntp.org   ibrust

​				   

​				  You need to add the network range you allow to receive requests from your network to synchronize time with this server.(In our case we are using 192.168.1.0/24 network)

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

2.  	**Install 	Tomcat version 8 (a brief explaination about the directories in doc)**

3. **Sol:** 	Install Tomcat version 8

4. ​	 	 	

5. ​	 	Create a user called "tomcat" to own the Tomcat 	installation.

6. 

7. ​    	     *$ 	useradd tomcat*

8. ​    	 Install 	the JDK from the tarball under the tomcat user.

9. 1. 1. *$ 			yum install java-1.8.0-openjdk*

10. ​    	 *$ 	su - tomcat*

11. ​    	  *$ 	tar -xzf /tmp/jdk-8u144-linux-x64.tar.gz*

12. ​    	  Install 	Tomcat from the tarball under the home directory of the "tomcat" 	user.

13. ​    	 *$ 	tar xzf /tmp/apache-tomcat-8.5.20.tar.gz*

14. Set 	the following environment variables and append them to the 	"/home/tomcat/.bash_profile" so they are set for 	subsequent logins.

15. 

16. ​    	  *export 	JAVA_HOME=/home/tomcat/jdk1.8.0_144*

17. ​    	  *export 	CATALINA_HOME=/home/tomcat/apache-tomcat-8.5.20*

18. ​    	  *export 	CATALINA_BASE=$CATALINA_HOME*

19. 

20. ​    	 Start 	and stop Tomcat using the following scripts.

21. 

22. ​    	  *$ 	$CATALINA_HOME/bin/startup.sh*

23. ​    	  *$ 	$CATALINA_HOME/bin/shutdown.sh*

24. 

25. The 	Tomcat logs are written to the "$CATALINA_HOME/logs/" 	directory by default.

26. 

27. Once 	Tomcat is started, the following URL should be available. 	Configuration for the management URLs is discussed below.

28. 

29. ​    	  http://localhost:8080/

30. ​    	  http://localhost:8080/manager/html

31. ​    	  http://localhost:8080/manager/status

32. 

33. ​    	  Remember 	to open up the port on the firewall if you want to access the site 	from other servers on the network.

34. ​	 	 Information about the Linux firewall is available here.

35. ​    	Checking 	the Status of Tomcat

36. 

37. ​    	 There 	are several ways to check the status of the service.

38. ​    	 *$ 	netstat -nlp | grep 8080*

39. ​    	 (Not 	all processes could be identified, non-owned process info

40. ​    	    will 	not be shown, you would have to be root to see it all.)

41. ​    	       tcp6 	      0      0 :::8080                 :::*                    	LISTEN      7564/java

42. ﻿ 	            *$ 	ps -ef | grep tomcat*

43. ​    	       oracle 	   7564     1 10 18:32 pts/0    00:00:15 /u01/jdk1.8.0_131/bin/java 	-Djava.util.logging.config.file=/u01/apache-tomcat-8.5.20/conf/logging.properties 	-Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager 	-Djdk.tls.ephemeralDHKeySize=2048 	-Djava.protocol.handler.pkgs=org.apache.catalina.webresources 	-classpath 	/u01/apache-tomcat-8.5.20/bin/bootstrap.jar:/u01/apache-tomcat-8.5.20/bin/tomcat-juli.jar 	-Dcatalina.base=/u01/apache-tomcat-8.5.20 	-Dcatalina.home=/u01/apache-tomcat-8.5.20 	-Djava.io.tmpdir=/u01/apache-tomcat-8.5.20/temp 	org.apache.catalina.startup. Bootstrap start

44. ​    	        oracle 	   7681  2645  0 18:35 pts/0    00:00:00 grep --color=auto tomcat

45. 

46. ​    	             $ 	HTTP/1.1 200 OK

47. ​    	               HTTP/1.1 	200

48. ​    	               Content-Type: 	text/html;charset=UTF-8

49. ​    	               Transfer-Encoding: 	chunked

50. ​    	               Date: 	Thu, 24 May 2018 17:35:36 GMT

51. The 	status is also available from the HTML management page.

52. Configuration 	Files

53. The 	main locations of configuration and log information are shown below.

54. Release 	Notes        : $CATALINA_HOME

55. Config 	              : $CATALINA_HOME/conf

56. Bin 	Directory        : $CATALINA_HOME/bin

57. Webapps 	             : $CATALINA_HOME/webapps

58. Logs 	                : $CATALINA_HOME/logs

59. Enabling 	HTML Management Access

60. Edit 	the "$CATALINA_HOME/conf/tomcat-users.xml" file, adding 	the following entries inside "tomcat-users" tag. Adjust 	the password as required.

61. <role 	rolename="manager-gui"/>

62. <role 	rolename="admin-gui"/>

63. <user 	username="tomcat" password="MyPassw0rd!" 	roles="manager-gui,admin-gui"/>

64. Restart 	Tomcat for the configuration to take effect.

65. *$CATALINA_HOME/bin/shutdown.sh*

66. *$CATALINA_HOME/bin/startup.sh*

67. 

68. The 	management application is now available from the 	﻿"http://localhost:8080/manager/html" 	URL.

69. Deploying 	Applications

70. 

71. You 	can get a sample application WAR file to test with from 	"http://tomcat.apache.org/tomcat-8.0-doc/appdev/sample/".

72. If 	this is a redeployment, delete the existing deployment from the 	"$CATALINA_HOME/webapps" directory.

73. 

74. *$ 	rm -Rf $CATALINA_HOME/webapps/sample*

75. 

76. Place 	the "sample.war" file in the "$CATALINA_HOME/webapps" 	directory and Tomcat with automatically deploy it. You will see a 	"sample" directory appear. To stop and start Tomcat  	

77. *$CATALINA_HOME/bin/shutdown.sh*

78. *$CATALINA_HOME/bin/startup.sh*

79. 

80.  	**Install 	java version 8 with home directory set as an environment variable**

81. 

82.  	**Install 	'build essentials' (mention in doc that why do we need it)**

​	**Sol:** It’s a tool for compiling and installing the packages which are not directly available for CentOS or any particular Linux distro. 'build essentials' is not directly available for CentOS it’s equivalant is “Development Tools”. Command for installation is this:

​	*$ yum groupinstall 'Development Tools'*

1. 

2.  	Install 	logrotate and rotate tomcat's catalina.out log as:

3. *$ 	ls -lrt /var/log/*

4. *$ 	yum install logrotate*

5. 1. 

   2.  		Rotate 		the log file after 500kb

   3. 

   4.  		keep 		only last 5 files

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

2.  	**Install 	git (a brief explaination about - what it is and why do we need it 	in doc)**

It most popular open source version control management software developed by Linus Torvalds. It is easy to start without any need to of a server, users don’t need to be connected to internet/network to use it.

1. 

2.  	**Q: 	After installing above check the respective logs if everything is 	installed and running (mention the log files name in doc)**

3. execute 	following  	

4. *$ 	which git		--* this 	will show the installation path

5. *$ 	git –version*	-- 	show installed current version

6.  	

7. 

8.  	 Also 	mention other files got created with software installation

​	