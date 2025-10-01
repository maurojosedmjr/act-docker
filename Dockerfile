FROM ubuntu:latest

RUN apt-get update && apt-get upgrade -y && apt-get install curl -y

RUN curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/nektos/act/master/install.sh | bash

WORKDIR /app

CMD ["/bin/bash"]
