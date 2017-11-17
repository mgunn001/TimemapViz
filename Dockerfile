FROM    ubuntu:16.04
LABEL   app.name="TMVis" \
        app.description="An implementation for Ahmed AlSum's Thumbnail Summarization Techniques for Web Archives." \
        app.repo.url="https://github.com/oduwsdl/tmvis" \
        app.maintainer="Maheedhar Gunnam <mgunnam@cs.odu.edu>"

EXPOSE  3000
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
