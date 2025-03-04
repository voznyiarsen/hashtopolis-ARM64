# hashtopolis-ARM64
Port of <a href="https://github.com/hashtopolis/server">hashtopolis-server</a> that works on arm64 architecture with SSL enabled both for web and python clients <br>
Run the `required.sh` script first to compile the server image <br>
Using certbot for creating SSL certificates is preffered, but you can self sign them if you don't own a domain (the python client won't be able to connect using HTTPS though) <br>
<br>
TODO: Rebuild using docker buildx
