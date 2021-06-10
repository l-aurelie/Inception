FROM alpine:3.12.7

RUN apk update

RUN apk install nginx

CMD ["nginx", "-g", "daemon off;"]
EXPOSE 80
