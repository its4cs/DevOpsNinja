

Solution Steps:

    Installed below plugins:
            Maven integration plugin
            Checkstyle Plug-in
            FindBugs Plug-in
            Static Analysis Collector Plug-in
            Cobertura Plugin

![Five plugins installed](https://github.com/its4cs/images/blob/master/1-JenkinsPlugins.png)

        Installed below softwares under Global tool configuration
    
            Maven | Maven 3.5.2

![Maven Installed](https://github.com/its4cs/images/blob/master/2-GTConf-mvn.png)

            Java | You need Oracle account for same | JDK 8u162
    
            Git | You need to manually install git first
    
            apt-get -y install git

![JDK Installed](https://github.com/its4cs/images/blob/master/2-GTConf-jdk.png)

Following three items running successfully:

![Item List]( https://github.com/its4cs/images/blob/master/3-ItemList.png)

    Setup CodeStability Job
        Choose Job type as MavenProject
        Provide git repository https://github.com/OpsTree/ContinuousIntegration
        Use clean compile as target

![Code Stability Workspace](https://github.com/its4cs/images/blob/master/3-1-ItemList.png)


    Setup static code analysis Job
        Choose Job type as MavenProject
        Provide git repository https://github.com/OpsTree/ContinuousIntegration
        Use clean compile findbugs:findbugs checkstyle:checkstyle as target

![Static Code Analysis](https://github.com/its4cs/images/blob/master/3-2-ItemList.png)


    Setup code coverage Job
        Choose Job type as MavenProject
        Provide git repository https://github.com/OpsTree/ContinuousIntegration
        Use clean compile cobertura:cobertura as target
        Use clean compile jococo:jococo as target 
![Code Coverage Workspace](https://github.com/its4cs/images/blob/master/3-3-ItemList.png)

![Code Coverage Report](https://github.com/its4cs/images/blob/master/3-3-ItemList.png)



Code coverage JoCoCo result:

```
[JaCoCo plugin] Collecting JaCoCo coverage data...
[JaCoCo plugin] **/**.exec;**/classes;**/src/main/java; locations are configured
[JaCoCo plugin] Number of found exec files for pattern **/**.exec: 0
[JaCoCo plugin] Saving matched execfiles:  
[JaCoCo plugin] Saving matched class directories for class-pattern: **/classes: 
[JaCoCo plugin]  - /var/lib/jenkins/workspace/Code coverage/Spring3HibernateApp/target/Spring3HibernateApp-1.8-SNAPSHOT/WEB-INF/classes 15 files
[JaCoCo plugin]  - /var/lib/jenkins/workspace/Code coverage/Spring3HibernateApp/target/classes 15 files
[JaCoCo plugin] Skipping save of matched source directories for source-pattern: **/src/main/java
[JaCoCo plugin] Loading inclusions files..
[JaCoCo plugin] inclusions: []
[JaCoCo plugin] exclusions: []
[JaCoCo plugin] Thresholds: JacocoHealthReportThresholds [minClass=0, maxClass=0, minMethod=0, maxMethod=0, minLine=0, maxLine=0, minBranch=0, maxBranch=0, minInstruction=0, maxInstruction=0, minComplexity=0, maxComplexity=0]
[JaCoCo plugin] Publishing the results..
[JaCoCo plugin] Loading packages..
[JaCoCo plugin] Done.
[JaCoCo plugin] Overall coverage: class: 0, method: 0, line: 0, branch: 0, instruction: 0
Finished: SUCCESS
```

