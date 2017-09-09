from node:latest

# set working dir
RUN mkdir /usr/src/app
WORKDIR /usr/src/app

ENV PATH /usr/sre/app/node_modules/.bin:$PATH

# isntall and cache app deps
ADD package.json
RUN npm install --silent
RUN npm install react-scripts@.9.5 -g --silent

ADD . /usr/src/app

CMD ["npm", "start"]
