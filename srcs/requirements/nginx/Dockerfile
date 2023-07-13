FROM alpine:latest
LABEL maintainer="flo"
RUN apt update && apt upgrade -y
RUN apt install nginx -y

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]