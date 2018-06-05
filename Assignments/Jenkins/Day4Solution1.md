
Solution Steps:

    Assignment1:
        Installed Nginx
        Installed below listed plugins
            SSH plugin
            Git plugin

    Assignment2:
        Enable password less login between jenkins & root user
        Check Global configuration and provide SSH remote host(root) details

    Assignment3:
        Create a tag creator Jenkins Job
        Job will create tag on your forked repo.
        Job should accept 2 parameters
            SRC_BRANCH
            TAG_NAME

    Assignment4:
        Sync your forked jenkins repo with https://github.com/ot-training/jenkins.git (using multiple remote).
        Create a Deployer Jenkins Job(static-code-deployment).
        It will checkout code from https://github.com//jenkins.git (your forked repo).
        Job will require a parameter TAG_NAME
        It will use SSH Publish plugin to publish files from jenkins server to target server
        Deploy index.html (existed inside attendees/assignments/day7) into nginx doc root.
        Update index.html (with your name) and create a new tag.
        Deploy with new tag.

    Assignment5:

        Installed tomcat7

        Installed mariadb in place of mysql, as it was suggested by yum install.

        Fork ContinuousIntegration from opstree account.

        Create a job Spring3HibernateApp-deployment
            This job will be copy of static-code-deployment
            Update deploymnet target to tomcat webapps directory
            This job and code-stability (job from 6th day assignmnet) will have common workspace.

        Deploy Spring3HibernateApp.war into tomcat7 (pick from workspace, copy into webapp of tomcat)

        Verify you can acecess http://:8080/Spring3HibernateApp/

    Assignment6:
        Configure nginx in a way so that it can serve
            static file (index.html) at http://
            java application (Spring3HibernateApp) at http:///Spring3HibernateApp/
            Hint: Add another location (Spring3HibernateApp/) and proxy_pass details in your nginx configireation.

    Assignment7:
        Deploy a demo node application
            Fork node-js-sample repo into your account
            Create a jenkins job to build node code and create a tar file(artifact)
            Stop already application, Deploy tar file on a target server and start application again. Hint: Use pm2 to start and stop node process (process management)

