FROM ruby:3.2.3

WORKDIR /myapp

COPY . .
RUN gem install bundler
RUN bundle install

EXPOSE 4000

