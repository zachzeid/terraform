FROM ubuntu:16.04

RUN apt-get update

RUN apt-get -y install unzip wget

RUN wget https://releases.hashicorp.com/terraform/0.11.1/terraform_0.11.1_linux_amd64.zip

RUN unzip terraform_0.11.1_linux_amd64.zip

RUN mv terraform /usr/local/bin/

RUN terraform --version
