FROM ruby:2.6.3
RUN  apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN  apt-get update && apt-get install -y build-essential libpq-dev nodejs vim

RUN mkdir /app
WORKDIR /app

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock

RUN gem install bundler
RUN bundle install

ADD . /app

RUN mkdir -p tmp/sockets