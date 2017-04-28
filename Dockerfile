FROM registry.idc-chengdu.wanda.com:5000/nodejs-base:latest
#FROM node:boron

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
RUN export http_proxy='http://198.74.106.172:10018' && export https_proxy='http://198.74.106.172:10018' && npm install

# Bundle app source
COPY . /usr/src/app

EXPOSE 8088
CMD [ "npm", "start" ]
