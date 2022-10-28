FROM nginxinc/nginx-unprivileged:1.23.0

USER 0:0
RUN apt-get update && apt-get upgrade -y
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs
RUN mkdir /opt/build-your-own-radar \
 && chown 101:101 -R /opt/build-your-own-radar /etc/nginx/conf.d
USER 101:101 

COPY --chown=101:101 . /src/build-your-own-radar
WORKDIR /src/build-your-own-radar
ENV HOME /src/build-your-own-radar
RUN npm install

CMD ["./build_and_start_nginx.sh"]
