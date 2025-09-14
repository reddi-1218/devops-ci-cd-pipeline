# multi-stage build for smaller images
FROM node:18-alpine AS builder
WORKDIR /app
COPY package.json package-lock.json* ./
RUN npm ci --only=production || npm install --only=production
COPY . .
# final runtime image
FROM node:18-alpine
WORKDIR /app
COPY --from=builder /app . 
EXPOSE 8080
CMD ["node", "app.js"]
