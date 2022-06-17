# Running Commands

To run the image, you can use the following command:

> docker run -d --name svn-server -p 8003:80 -p 3690:3690 -v /Docker/svnserver:/home/svn -w /home/svn elleflorio/svn-server 

You can optionally bind a local folder to the container folder that will store your repositories using the flag -v <hostpath>:/home/svn, or a docker volume can be created

> docker volume create svn-root

> docker run -d --name svn-server-elleflorio -p 8003:80 -p 3690:3690 -v svn-root:/home/svn -w /home/svn elleflorio/svn-server

## Official webpage

> https://hub.docker.com/r/elleflorio/svn-server/
> https://medium.com/@elle.florio/the-svn-dockerization-84032e11d88d


## Configuration

You need to setup username and password for the access via WebDav protocol. You can use the following command from your host machine:

> docker exec -t svn-server htpasswd -b /etc/subversion/passwd <username> <password>
> docker exec -t svn-server-elleflorio htpasswd -b /etc/subversion/passwd giuseppe.grilli	Abcd1234

To verify that everything is up and running, open your browser and connect to http://localhost/svn. The system should ask you for the username and password, then it will show you an empty folder (no repos yet!). Check also that the custom protocol is working fine: go to your terminal and type svn info svn://localhost:3690. The system should connect to the server and tell you that is not able to find any repository. For further information on how to configure Subversion, please refer to the official web page.

### Alternative configuration via SVNADMIN

The image provides a graphical ui using the SVNADMIN interface via http://localhost/svnadmin. You'll be prompted with a setup page, remember to test every step on the page then save the configuration.

### SvnAdmin configuration

- Subversion auhtorization file
	+ /etc/subversion/subversion-access-control
- User authentication file (SVNUserFile)
	+ /etc/subversion/passwd
- Parent directory of the repositories (SVNParentPath)
	+ /home/svn
- Subversion client executable
	+ /usr/bin/svn
- Subversion admin executable
	+ /usr/bin/svnadmin