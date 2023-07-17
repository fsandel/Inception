FROM debian:12.0
LABEL maintainer="fsandel@student.42heilbronn.de"

RUN apt update && apt upgrade -y
RUN apt install wordpress -y

CMD ["./tools/wordpress_setup.sh"]