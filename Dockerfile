FROM nginx:1.17-alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf.tmp

CMD [ "sh", "-c", "envsubst < /etc/nginx/conf.d/default.conf.tmp > /etc/nginx/conf.d/default.conf && exec nginx -g 'daemon off;'" ]