#NzbGet
A dockerfile to run the usenet downloader NzbGet. It expects a  partition to store data mapped to /config in the container, and a volume where your downloads should go stored at /media. Enjoy!

This dockerfile uses a user with uid 236. Make sure this user has write access to the /config folder. 
##Example run command
`docker run -d --restart=always --name NzbGet --volumes-from Data --volumes-from media -p 6789:6789 adamant/nzbget`