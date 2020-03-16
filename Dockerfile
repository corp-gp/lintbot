FROM ruby:2.6.5-stretch
MAINTAINER Ermolaev Andrey

RUN apt-get update \
 && apt-get install -y cmake

RUN apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN echo 'gem: --no-document' >> "$HOME/.gemrc"

RUN gem install bundler

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

ENV BUNDLE_PATH /usr/local/bundle
RUN bundle install

# after bundle install for fast build
COPY danger_rules /danger_rules
COPY Dangerfile /Dangerfile