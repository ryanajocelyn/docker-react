FROM node:alpine AS build-web

WORKDIR /usr/frontend
COPY package.json .
RUN npm install

COPY . .
RUN npm run build

FROM nginx
COPY --from=build-web /usr/frontend/build /usr/share/nginx/html
