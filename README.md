# 🗄️ Docker Server Time 🐳

Docker Server Time is a repo for learning more about running servers using Docker

## Getting Started

* Build the image:  
`docker build --file server.Dockerfile --tag first-docker-server .` 

* Create and start a server container based on the built image:  
`docker run -d first-docker-server`  
The '-d' is for detached mode, which will create and start the container but does not attach the terminal to it. Could also use the longer method with 'docker container create' and 'docker container start'

## Troubleshooting

Do not use 'docker run first-docker-server' because it attaches the terminal to the container, and the terminal will hang.  
To stop the container, open a new terminal window and run `docker ps` to get the ID of the container, then `docker kill ####` where `####` is the beginning of the container ID.

## Run Commands from the Container

* Get the date and time from the container:  
`docker exec #### date`

* Start a terminal session within the container:  
`docker exec --interactive --tty #### bash`

* Stop the container 
`docker stop ####`  
This will attempt to gracefully stop the container, and can take a little while to complete.

* If you need to forcefully stop the container (use with caution, this can risk data loss):  
`docker stop -t 0 ####`

* Remove a container (will NOT stop containers that are running):  
`docker rm ####`

* Remove a container (will stop containers that are running):  
`docker rm -f ####`

* Remove all idle containers:  
`docker ps -aq | xargs docker rm`  
Show all containers with 'docker ps -a' and use 'q' for quiet output that returns only the IDs, then '|' to feed the output to 'xargs' which runs an 'rm' on each ID.

* List Docker images  
`docker images`

* Remove Docker images  
`docker rmi <image-name>`

* Forcefully Remove Docker images:  
`docker rmi -f <image-name>`  
If you get a message saying you cannot remove an image from a container that is running, stop the container first and try again. Could also force it but this is not recommended as it can cause unpredictable behavior.

* Remove all Docker images  
`docker images -q | xargs docker rmi`