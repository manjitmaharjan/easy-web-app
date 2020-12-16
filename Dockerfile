FROM node:12.16.1-alpine as build
# working dir inside container
WORKDIR /app
#Copy dependencies files
COPY package*.json ./
# run dependencies
RUN npm install
# COPY all current dir content to working dir

COPY . .

#ARG configuration=production
#RUN npm run build -- --configuration $configuration
#RUN ng build 
# the base image for this is an alpine based nginx image
FROM nginx:alpine
# copy the build folder from react to the root of nginx (www)
COPY  /app /usr/share/nginx/html
# expose port
EXPOSE 80
