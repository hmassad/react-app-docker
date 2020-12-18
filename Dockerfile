# https://github.com/kunokdev/cra-runtime-environment-variables

# => Build container
FROM node:12-alpine as builder
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn
COPY . ./
RUN yarn build

# => Run container
FROM nginx:1.19.6-alpine

# Nginx config
RUN rm -rf /etc/nginx/conf.d
COPY nginx /etc/nginx

# Static build
COPY --from=builder /app/build /usr/share/nginx/html/

EXPOSE 80

# Add bash
RUN apk add --no-cache bash

# Start Nginx server
CMD ["/bin/bash", "-c", "nginx -g \"daemon off;\""]
