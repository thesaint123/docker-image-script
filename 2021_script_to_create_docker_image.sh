#!/bin/bash
# This script help to create docker image by answering serie o questions to collect the instructions and dependencies.
# created by Mocktar TAIROU
# Greensboro, NC August, 2021
# Feel free to send me any suggestion or contribution. 
# Email: mocktar.tairou@gmail.com
# github: https://github.com/mocktar77 
echo "Hi ${USER}, the purpose of this script is to create a Dockerfile"
sleep 3
echo "to build a docker image from the Dockerfile"
sleep 3
echo " and finally to delete the dockerfile"
sleep 3
echo "${USER}, please enter the instructions needed to create the Dockerfile as following"
echo "Be careful and double check your answers..."
sleep 3
echo "What is the base image?"
read FROM
# This command will create the Dockerfile and add the instruction FROM to the file created.
# Since the base image is mandatory, we will put a mandatory condition in case the user doesn't answered the question.
if [ -n "$FROM" ]
then
echo "FROM ${FROM}" > Dockerfile
else 
echo " Please enter the base image. This is mandatory..."
fi
echo "Please enter the Maintainer"
echo "Or press enter if there is no Maintainer"
read MAINTAINER
# This if condition will check if the user enter a Maintainer.
# In that case the instruction will be appended to the Docker file.
# If not no Maintainer will be created in the Dockerfile.
if [ -n "$MAINTAINER" ]
then
echo "MAINTAINER ${MAINTAINER}" >> Dockerfile
else 
echo " " >> Dockerfile
fi
echo "What commands are you willing to run?"
echo "If multiple commandes, please seperates them with ; semi-colon"
echo "Or press enter is there is no cammand"
read RUN
# This if condition will check if the user enter some commands to run.
# In that case the instruction will be appended to the Docker file.
# If not no RUN instruction will be created in the Dockerfile.
if [ -n "$RUN" ]
then
echo "RUN ${RUN}" >> Dockerfile
else 
echo " " >> Dockerfile
fi 
echo "What file do you want to copy to this image and what is the destination path?"
echo "Or press enter if there is file to copy"
read COPY
# This if condition will check if the user enter a file to copy and a path to the destination.
# In that case the instruction will be appended to the Docker file.
# If not no Copy instruction will be created in the Dockerfile.
if [ -n "${COPY}" ]
then
echo "COPY ${COPY}" >> Dockerfile
else 
echo " " >> Dockerfile
fi
echo "What is the Entrypoint of your image?"
echo "Or press enter if there is no Entrypoint"
read ENTRYPOINT
# This if condition will check if the user enter any Entrypoint.
# In that case the instruction will be appended to the Docker file.
# If not no Entrypoint will be created in the Dockerfile.
if [ -n "$ENTRYPOINT" ]
then
echo "ENTRYPOINT ${ENTRYPOINT}" >> Dockerfile
else 
echo " " >> Dockerfile
fi
echo "What port are you willing to expose on the container?"
echo "Or press enter if there is no port to expose"
read EXPOSE
# This if condition will check if the user enter a port to open on the container.
# In that case the Instruction EXPOSE with the port number will be appended to the Docker file.
# If not no EXPOSE instruction will be created in the Dockerfile.
if [ -n "$EXPOSE" ]
then
echo "EXPOSE ${EXPOSE}" >> Dockerfile
else 
echo " " >> Dockerfile
fi 
echo "what command do you want to run at the container's spin up time"
echo "Or press enter if there is no command"
read CMD
# This if condition will check if the user enter some commands to run while spinning up the container.
# In that case the instruction will be appended to the Docker file.
# If not no Run instruction will be created in the Dockerfile.
if [ -n "$CMD" ]
then
echo "CMD ${CMD}" >> Dockerfile
else 
echo " " >> Dockerfile
fi 
echo "What is the name of your image"
read IMAGE
echo "$IMAGE is being created............"
# This command ewill create the docker image using the Dockerfile located in the present working directory.
# The t option will tag the image will the name stored in the variable IMAGE.
docker build -t ${IMAGE} .
sleep 3
echo
echo
echo "Let's check if the image was created"
sleep 3
echo
echo
# The following command will display the list of the images on the server.
docker images
#This final command will delete the Dockerfile used to buil the image
rm -f Dockerfile
echo
sleep 3
echo "you can now spin up as many containers you want with ${IMAGE} image."
echo " "
echo " "
