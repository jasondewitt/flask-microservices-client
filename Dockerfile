from node:latest

# set working dir
RUN mkdir /usr/src/app
WORKDIR /usr/src/app

ENV PATH /usr/sre/app/node_modules/.bin:$PATH

# add envrionment vars
ARG REACT_APP_USERS_SERVICE_URL
ARG NODE_ENV
ENV NODE_ENV $NODE_ENV
ENV REACT_APP_USERS_SERVICE_URL $REACT_APP_USERS_SERVICE_URL

# isntall and cache app deps
ADD package.json /usr/src/app/package.json
RUN npm install
RUN npm install pushstate-server -g --silent

ADD . /usr/src/app

RUN npm run build

CMD ["pushstate-server", "build"]
