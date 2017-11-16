FROM    ubuntu:16.04
LABEL   maintainer="Maheedhar Gunnam <mgunnam@cs.odu.edu>"

EXPOSE  15421 15422 1338
WORKDIR /app

RUN     apt-get update && apt-get install -y \
          imagemagick \
          nodejs \
          npm \
          phantomjs \
        && rm -rf /var/lib/apt/lists/* \
        && ln -s /usr/bin/nodejs /usr/bin/node

COPY    ./package.json /app/
RUN     npm install
COPY    . /app

CMD     ["node", "tmvis.js"]
