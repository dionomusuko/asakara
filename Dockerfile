FROM ruby:2.5
RUN  apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN  apt-get update && apt-get install -y build-essential libpq-dev nodejs

WORKDIR /myapp

ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfiel.lock

RUN gem install bundler
RUN bundle install

ADD . /myapp