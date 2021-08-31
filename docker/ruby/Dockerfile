FROM ruby:2.7
RUN apt-get update && apt-get install -y \
      build-essential \
      nodejs \
      yarn
WORKDIR /app
COPY . .
RUN bundle install 