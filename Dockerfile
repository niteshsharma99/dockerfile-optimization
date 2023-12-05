FROM ubuntu:latest
RUN apt-get update
RUN apt-get install -y openssh-server
RUN apt-get install -y vim
RUN apt-get install -y gcompat;exit 0
WORKDIR /app-files
#Set env variable of ADMIN_USER.
# In future, the value will be retreived from Vault.
ENV ADMIN_USER="appadmin"
#Add Value of ENV Variable to a file.
RUN echo $ADMIN_USER > ./user-creds.txt
#Unset the ENV Variable after value added to file.
RUN unset ADMIN_USER
#Copy The App contents stored in custom-app folder to app-files.
#The txt files in custom-app can be ignored/skipped.
COPY custom-app /app-files 
EXPOSE 8080
# Start app binary  named custom.
CMD ["/app-files/custom"]
