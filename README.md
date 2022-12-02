# Project 5
# Part 1
-This project is to show how to create our own custom respository, run and use docker and dockerhub and how to intergrate dockerhub with github so that any changes to the repository will be displayed in the image that is pushed to dockerhub

-On my local device I installed docker on WSL2 using Docker Desktop since it comes with WSL2 integration allowing me to easily create containers in my ubuntu instance.

-After creating a Dockerfile you would run the command "docker build . -t <Name here>" where the . means your Dockerfile is located within the directory you're running the command from.

-Once you build the image you use the command "$ docker run -dit --name <Container name> -p 8080:80 <image name>" -p binds the ports so any commands sent to port 80 will be redirected to port 8080

-After the container begins to run you can type the ip of your device and it will direct you to the 
webpage

# Part 2
-After logging in to the docker hub website you will have an option that will ask you to create a repository. you give it a name and set it to public and then publish the repository.

-you can use the command "docker login" to login to docker hub with your credentials. I used my Username and Password but you can also use a auth token for a more secure login but I just didn't make one.

-You can use the command "docker push <container name>" to push the latest instance of the image to docker hub.

-My secrets called DOCKERHUB_USERNAME and DOCKERHUB_PASSWORD contain my login information of docker hub

-When my main branch goes through a new push it will build the image and then push the image to my docker hub

# Part 3
- My restart script looks like this "#!/bin/sh
-#Pull latest version of the image
-docker pull cromasource/project5:PetrockApache
-#Remove unused images
-docker image prune -f
-#Stop the container
-docker kill petrockapache
-#Remove the container
-docker rm petrockapache
-Recreate the container
-docker run -p 80:80 -d --name petrockapache cromasource/project5:PetrockApache"

Used from this script from the article: https://blog.devgenius.io/build-your-first-ci-cd-pipeline-using-docker-github-actions-and-webhooks-while-creating-your-own-da783110e151


-In dockerhub there's a webhook page that you can use to notify webhook of any chnages that dockerhub registers.

-I used the command "sudo apt-get install webhook" to install my webhook program

-My hooks.yml looks like this '- id: redeploy-webhook
 - execute-command: "/var/scripts/redeploy.sh"
 - command-working-directory: "/var/scripts"
  '

  # Part 4
