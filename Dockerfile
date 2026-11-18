# FROM node:20-alpine
# WORKDIR /app
# COPY . . 
# RUN yarn install --production && yarn cache clean
# ENTRYPOINT ["node"]
# CMD ["src/index.js"]
# EXPOSE 3000



FROM node:20-bookworm-slim

WORKDIR /app

COPY package*.json ./

RUN npm ci --omit=dev

COPY . .

ENV NODE_ENV=production

EXPOSE 3000

CMD ["node", "src/index.js"]
