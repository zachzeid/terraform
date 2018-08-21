FROM ubuntu:16.04

RUN apt-get update

RUN apt-get -y install unzip wget git
RUN mkdir terraform && cd terraform
RUN wget https://releases.hashicorp.com/terraform/0.11.8/terraform_0.11.8_linux_amd64.zip

RUN unzip terraform_*.zip
RUN rm terraform_*.zip

RUN mv terraform /usr/local/bin/

RUN terraform --version


RUN git clone https://github.com/zachzeid/terraform.git
RUN ls && pwd
RUN terraform plan -var deployed_from=herpaderp -out gcp_terraform
RUN terraform apply gcp_terraform
