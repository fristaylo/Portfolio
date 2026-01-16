FROM node:22-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install --omit=dev

COPY . .
RUN npm run build

FROM node:22-alpine AS runner

ENV NUXT_HOST=0.0.0.0
ENV NUXT_PORT=3000

WORKDIR /app

COPY --from=builder /app/.output/server ./server
COPY --from=builder /app/.output/public ./public
COPY package.json .

EXPOSE 3000

CMD [ "node", "server/index.mjs" ]
