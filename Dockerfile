FROM ruby:2.5.5

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /hateblocker

WORKDIR /hateblocker

COPY Gemfile /hateblocker/Gemfile
COPY Gemfile.lock /hateblocker/Gemfile.lock

RUN bundle install
