FROM node:20

WORKDIR /app

# On copie tout le projet
COPY . .

# Installation et build
RUN npm install
RUN npm run build

# PETIT TEST : Cette ligne va afficher dans tes logs de build 
# exactement où se trouvent les fichiers, pour qu'on soit sûrs.
RUN ls -R dist

EXPOSE 3000

# On utilise "npm start" au lieu de "node dist/index.js"
# car le package.json de DataForSEO contient déjà le bon chemin.
# On passe les arguments après le "--"
CMD ["npm", "start", "--", "--sse", "--port", "3000"]