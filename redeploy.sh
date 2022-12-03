#!/bin/sh
# Pull latest version of the image
docker pull cromasource/project5:PetrockApache
# Remove unused images
docker image prune -f
# Stop the container
docker kill petrockapache
# Remove the container
docker rm petrockapache
# Recreate the container
docker run -p 80:80 -d --name petrockapache cromasource/project5:PetrockApache
