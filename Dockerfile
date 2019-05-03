FROM ruby:2.5.5
MAINTAINER jjs276@gmail.com

ARG RAILS_PORT

RUN apt-get update && apt-get install -y \
  build-essential \
  libpq-dev nodejs

RUN mkdir -p /$COMPOSE_PROJECT_NAME
WORKDIR /$COMPOSE_PROJECT_NAME

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install

COPY . ./

EXPOSE $RAILS_PORT

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
