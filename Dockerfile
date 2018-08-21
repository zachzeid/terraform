FROM ubuntu:16.04

RUN apt-get update

RUN apt-get install unzip

RUN wget https://releases.hashicorp.com/terraform/0.11.1/terraform_0.11.1_linux_amd64.zip

unzip terraform_0.11.1_linux_amd64.zip

RUN mv terraform /usr/local/bin/

RUN terraform --version
