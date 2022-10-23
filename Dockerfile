# This docker container builds application used for a  research in University of Malaga
# FROM node:12.2.0-alpine as semanticapp

# WORKDIR /app
# #copy the  app files  to the container
# COPY . /app/ 

# # create semanticapp artifact to be copied into Nginx server
# RUN npm install

# RUN npm  build

# #prepare nginx
FROM nginx:1.16.0-alpine

COPY  /build /usr/share/nginx/html
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d



#start up nginx  and listen on port 80
EXPOSE 80 
CMD ["nginx","-g","daemon off;"]