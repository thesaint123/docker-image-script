At work I was faced with issues related to building docker images a lot. and this calls for troubleshooting ( forgot to expose port, forgot to add CMD instruction for a daemon , copy data to wrong path and so on...) all the time. 
So I decided to write a script that will be used to create docker images. 
Basically the script is asking a couple questions from the user and based on those questions, 
a dockerfile is created, 
a docker image is then built from it.
The script check at the end to make sure that the image was created 
then the dockerfile used is deleted.
