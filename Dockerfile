#FROM node:alpine AS build-web
FROM node:alpine

WORKDIR /usr/frontend
COPY package.json .
RUN npm install

COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=0 /usr/frontend/build /usr/share/nginx/html
#COPY --from=build-web /usr/frontend/build /usr/share/nginx/html
