FROM node:alpine as 
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx:stable-alpine
COPY --from=builder_phase /app/build /usr/share/ngnix/html


