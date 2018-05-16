FROM jenkins/jenkins:lts

USER root

RUN apt-get update -y \
&& apt-get -y install sshpass

# Define working directory.
WORKDIR /data

USER jenkins
