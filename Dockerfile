# syntax=docker/dockerfile:1.4
FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN --mount=type=cache,target=/root/.npm,sharing=locked npm ci
COPY . .

FROM node:20-alpine AS app
WORKDIR /app
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/index.js ./
COPY --from=builder /app/package.json ./
RUN chown -R node:node ./
USER node

EXPOSE 3000
CMD ["node", "index.js"]
