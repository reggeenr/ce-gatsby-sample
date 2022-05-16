##
## STAGE 1 - Building the gatsby stuff
##
FROM node:latest as builder
RUN apt-get update || : && apt-get install python -y

WORKDIR /app
COPY package*.json .
RUN npm install
COPY . .
RUN ["npm", "run", "build"]

##
## STAGE 2 - Serving the static content
##
FROM nginx

EXPOSE 8080
COPY --from=builder /app/public /usr/share/nginx/html