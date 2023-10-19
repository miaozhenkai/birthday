FROM nginx:1.25.2-alpine3.18-slim
LABEL authors="miaozhenkai"

ADD . /var/www/yuyan.ink
RUN echo "server {\
              gzip on;\
              gzip_vary on;\
              gzip_comp_level 6;\
              gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript image/svg+xml image/jpeg image/gif image/png font/woff image/x-icon audio/mpeg;\
          \
              listen       80;\
              listen  [::]:80;\
              server_name  520.yuyan.ink;\
              location / {\
                  root   /var/www/yuyan.ink;\
                  index  index.html index.htm;\
              }\
          \
              error_page   500 502 503 504  /50x.html;\
              location = /50x.html {\
                  root   /usr/share/nginx/html;\
              }\
          }" > /etc/nginx/conf.d/default.conf

EXPOSE 443
