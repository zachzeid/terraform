FROM ubuntu:16.04

RUN apt-get update

RUN apt-get -y install unzip wget git

RUN wget https://releases.hashicorp.com/terraform/0.11.8/terraform_0.11.8_linux_amd64.zip

RUN unzip terraform_*.zip

RUN mv terraform /usr/local/bin/

RUN terraform --version

RUN pwd

RUN mkdir terraform

RUN git clone https://github.com/zachzeid/terraform.git
