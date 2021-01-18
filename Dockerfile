FROM ruby:2.7.1-alpine

RUN apk add --no-cache build-base

COPY Gemfile /usr/src/app/deliveroo.engineering/
WORKDIR /usr/src/app/deliveroo.engineering
RUN gem install bundler -v 2.1.4 && bundle install -j8

EXPOSE 4000
ENTRYPOINT ["jekyll"]
CMD ["serve", "-w", "-t", "-H", "0.0.0.0"]
