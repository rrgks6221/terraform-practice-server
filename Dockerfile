FROM node:16.20.2 AS builder
WORKDIR /app

COPY . .

RUN npm install
RUN npm run build

FROM node:16.20.0
WORKDIR /app

COPY --from=builder /app ./
CMD ["npm", "run", "start:prod"]