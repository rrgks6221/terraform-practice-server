FROM node:18.16.0 AS builder
WORKDIR /app

COPY . .

RUN npm install
RUN npm run build

FROM node:18.16.0-alpine
WORKDIR /app

COPY --from=builder /app ./
CMD ["npm", "run", "start:prod"]