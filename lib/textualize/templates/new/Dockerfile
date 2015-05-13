FROM nginx

RUN apt-get update

RUN apt-get install -y \
  build-essential \
  curl \
  git \
  automake \
  libtool \
  ruby-full
RUN curl -sL https://deb.nodesource.com/setup | bash - \
  && apt-get install -y nodejs
RUN npm install -g gulp
RUN gem install bundler

ADD . /website
WORKDIR /website
RUN npm install
RUN gulp
RUN bundle install
RUN bundle exec textualize request_specs

COPY ./dist /usr/share/nginx/html

RUN rm -rf /usr/lib/node_modules
RUN rm -rf ./node_modules

RUN apt-get purge -y nodejs \
  build-essential \
  curl \
  git \
  automake \
  libtool \
  ruby-full
