FROM node:16.17.0-alpine as builder
WORKDIR /app
COPY app/package.*json .

RUN npm install
COPY app/ .
ARG TMDB_V3_API_KEY
ENV VITE_APP_TMDB_V3_API_KEY=$TMDB_V3_API_KEY
ENV VITE_APP_API_ENDPOINT_URL="https://api.themoviedb.org/3"
RUN npm run build

FROM nginx:stable-alpine
 
RUN rm -rf ./usr/share/nginx/html/*

COPY --from=builder /app/dist /usr/share/nginx/html
EXPOSE 80
ENTRYPOINT ["nginx", "-g", "daemon off;"]
