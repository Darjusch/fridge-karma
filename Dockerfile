FROM node:lts-alpine

# install simple http server for serving static content
RUN npm install --quiet -g http-server

# install the vue-cli
RUN npm install --quiet --global \
      @vue/cli

# create app directory
RUN mkdir /app

# copy both 'package.json' and 'package-lock.json' (if available)
COPY package*.json /app/

# copy project files and folders to the current working directory (i.e. 'app' folder)
COPY . /app/

# make the 'app' folder the current working directory
WORKDIR /app

# install project dependencies
RUN npm install

# build the app
RUN npm run build