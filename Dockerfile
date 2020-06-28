FROM custom-node-image as installer

WORKDIR /app

COPY . .

RUN npm i

RUN npm run test:prod

RUN npm run build:prod

FROM nginx

COPY --from=installer /app/dist/myapp /usr/share/nginx/html/

# CMD [ "/bin/bash", "-c", "envsubst < /usr/share/nginx/html/assets/env_token.js > /usr/share/nginx/html/assets/env.js" ]
