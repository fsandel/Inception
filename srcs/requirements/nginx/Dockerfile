FROM debian:12.0
LABEL maintainer="fsandel@student.42heilbronn.de"

RUN apt update && apt upgrade -y
RUN apt install nginx -y
RUN apt install openssl -y

EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]