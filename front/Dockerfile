FROM node:22-alpine

WORKDIR /app

RUN npm i pnpm --global

COPY package*.json .
RUN pnpm install

COPY . .

EXPOSE 5173

CMD [ "pnpm", "dev" ]


