FROM nginxinc/nginx-unprivileged:1.23.0

USER 0:0

RUN apt-get update && apt-get upgrade -y

RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get install -y nodejs

RUN                                                                       \
  apt-get install -y                                                      \
  libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3    \
  libxss1 libasound2 libxtst6 xauth xvfb g++ make

WORKDIR /src/build-your-own-radar
COPY package.json ./
COPY package-lock.json ./
RUN npm ci

COPY . ./

USER 101:101

# Override parent node image's entrypoint script (/usr/local/bin/docker-entrypoint.sh),
# which tries to run CMD as a node command
ENTRYPOINT []
CMD ["./build_and_start_nginx.sh"]
