FROM node:20
WORKDIR /app
# On copie TOUT le code source (src, package.json, etc.)
COPY . .
# Installation des dépendances définies dans ton package.json
RUN npm install
# Compilation du TypeScript vers le dossier /dist
RUN npm run build
EXPOSE 3000
# On lance le serveur compilé avec les flags SSE pour n8n
CMD ["node", "dist/index.js", "--sse", "--port", "3000"]
