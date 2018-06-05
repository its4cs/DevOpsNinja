

Solution Steps:

    Installed below plugins:
            Maven integration plugin
            Checkstyle Plug-in
            FindBugs Plug-in
            Static Analysis Collector Plug-in
            Cobertura Plugin

https://github.com/its4cs/images/blob/master/1-JenkinsPlugins.png

        Installed below softwares under Global tool configuration

            Maven | Maven 3.5.2

https://github.com/its4cs/images/blob/master/2-GTConf-mvn.png

            Java | You need Oracle account for same | JDK 8u162

            Git | You need to manually install git first

            apt-get -y install git

https://github.com/its4cs/images/blob/master/2-GTConf-jdk.png

Following three items running successfully:

 https://github.com/its4cs/images/blob/master/3-ItemList.png

    Setup CodeStability Job
        Choose Job type as MavenProject
        Provide git repository https://github.com/OpsTree/ContinuousIntegration
        Use clean compile as target

https://github.com/its4cs/images/blob/master/3-1-ItemList.png


    Setup static code analysis Job
        Choose Job type as MavenProject
        Provide git repository https://github.com/OpsTree/ContinuousIntegration
        Use clean compile findbugs:findbugs checkstyle:checkstyle as target

https://github.com/its4cs/images/blob/master/3-2-ItemList.png


    Setup code coverage Job
        Choose Job type as MavenProject
        Provide git repository https://github.com/OpsTree/ContinuousIntegration
        Use clean compile cobertura:cobertura as target
![Code Coverage Workspace]
(https://github.com/its4cs/images/blob/master/3-3-ItemList.png)
