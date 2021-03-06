FROM node:alpine

# create destination directory
RUN mkdir -p /usr/src/node-api
WORKDIR /usr/src/node-api

# update and install dependency
RUN apk update && apk upgrade
RUN apk add python3 g++ make

# copy the app, note .dockerignore
COPY . /usr/src/node-api/
RUN npm install
RUN npm install --save bcrypt-nodejs && npm uninstall --save bcrypt

# email configuration
# RUN apk add msmtp
# RUN ln -sf /usr/bin/msmtp /usr/sbin/sendmail

# expose 3003 on container
EXPOSE 3003

# start the app
CMD [ "npm","run", "start:dev" ]