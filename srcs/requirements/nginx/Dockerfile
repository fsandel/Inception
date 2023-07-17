FROM debian
LABEL maintainer="fsandel@student.42heilbronn.de"

RUN apt update && apt upgrade -y
RUN apt install nginx -y

EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]