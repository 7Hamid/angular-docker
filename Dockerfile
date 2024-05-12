#first stage of building angular image
FROM node:alpine3.17 as build
RUN mkdir -p /app
WORKDIR /app
COPY package.json /app/
RUN npm install
COPY . /app/
RUN npm run build --prod

FROM nginx:latest
COPY --from=build /app/dist/ngdocker /usr/share/nginx/html
EXPOSE 80
