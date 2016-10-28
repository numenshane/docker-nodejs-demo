FROM registry.idc-chengdu.wanda.com:5000/nodejs-base:latest

# Create app directory
RUN mkdir -p /usr/src/app
RUN export http_proxy='http://207.226.141.162:10018'
RUN export https_proxy='http://207.226.141.162:10018'
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
RUN npm install

# Bundle app source
COPY . /usr/src/app

EXPOSE 8088
CMD [ "npm", "start" ]
