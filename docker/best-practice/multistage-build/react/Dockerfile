# đại loại là build
FROM node:12 AS build
WORKDIR /app
COPY package* yarn.lock ./
RUN yarn install
COPY public ./public
COPY src ./src
RUN yarn run build

# sau đó copy toàn bộ file build vào image cuối
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html