FROM node:carbon

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY . /usr/src/app/

RUN npm install -g typescript ts-node && npm install

USER node

COPY --chown=node:node . .

# Build Args
ARG MONGO_URI_LOCAL
ARG MONGO_URI_PROD

# Environment variables
ENV MONGO_URI_LOCAL=$MONGO_URI_LOCAL
ENV MONGO_URI_PROD=$MONGO_URI_PROD

EXPOSE 3000

CMD npm run start