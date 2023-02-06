FROM --platform=linux/amd64 node:18.4.0-alpine

# https://osusublog.net/?p=2238
WORKDIR /app
COPY ./package.json /app
COPY . /app

RUN npm i
RUN npm run build

ENV HOST 0.0.0.0

EXPOSE 3000

CMD ["npm", "run", "start"]