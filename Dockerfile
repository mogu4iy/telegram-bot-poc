FROM node:16-alpine

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
WORKDIR /home/node/app
USER node

COPY --chown=node:node package*.json ./
RUN npm install
COPY --chown=node:node . .

RUN npm run build
RUN rm -rf src

ENTRYPOINT  ["./entrypoint.sh"]