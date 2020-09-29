FROM node:12.18

RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y libc6:i386 libstdc++6:i386

WORKDIR /usr/src/app

RUN npm i pkg -g

COPY ./test.js .
COPY ./fetched-v12.18.1-linux-arm64 .

RUN mkdir -p "$HOME/.pkg-cache/v2.6"

RUN cp fetched-v12.18.1-linux-arm64 "$HOME/.pkg-cache/v2.6"

CMD pkg test.js -t node12-linux-arm64