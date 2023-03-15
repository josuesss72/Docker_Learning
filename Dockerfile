FROM node:19-alpine3.16

WORKDIR /app

COPY package.json .
COPY package-lock.json .

RUN npm config set legacy-peer-deps true
RUN npm config set registry http://registry.npmjs.org
RUN npm install

COPY . .

RUN npm run build

EXPOSE 3000

CMD ["npm", "run", "dev"]
