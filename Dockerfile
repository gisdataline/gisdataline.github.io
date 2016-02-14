FROM alpine:3.2

MAINTAINER XU Minzheng <jiv9418@gmail.com> 

# Install Nginx
RUN apk update && \
    apk add nginx && \
    echo "Done"

# Copy blog source

COPY ./ /usr/share/nginx/html

RUN ln -sf /dev/stdout /var/log/nginx/access.log && ln -sf /dev/stderr /var/log/nginx/error.log && \
    echo "Done"

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]