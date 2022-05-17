##
## STAGE 1 - Building the gatsby stuff
##
FROM node:latest as builder

# Preparation steps to setup the build environment 
RUN apt-get update || : && apt-get install python -y
WORKDIR /app
COPY package*.json .
RUN npm install

# Copy all files into the container image
COPY . .

# Command that is being executed at container build time
RUN ["npm", "run", "build"]

# Command that is being executed at deploy time
CMD ["npm", "run", "serve"]