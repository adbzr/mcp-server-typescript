# Étape de build
FROM node:20 AS builder
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

# Étape d'exécution
FROM node:20-slim
WORKDIR /app
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/node_modules ./node_modules
EXPOSE 3000
# Commande pour lancer le serveur en mode SSE pour n8n
CMD ["node", "dist/index.js", "--sse", "--port", "3000"]
