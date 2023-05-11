FROM node:18-bullseye-slim

ARG ARG_ENV

ENV ENV=${ARG_ENV}
ENV NODE_ENV='production'
ENV NODE_OPTIONS='--max-old-space-size=8192'

EXPOSE 3000

WORKDIR /app

RUN rm -rf ./*
COPY . .

RUN NODE_ENV=development npm install
RUN npm run build
RUN rm -rf node_modules .svelte-kit

CMD npm run start
