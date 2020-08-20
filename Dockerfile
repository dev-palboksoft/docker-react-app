FROM node:alpine as builder
WORKDIR '/home/test'
COPY package.json .
RUN npm install
COPY ./ ./
RUN npm run build 

FROM nginx 
COPY --from=builder /home/test/build /usr/share/nginx/html