FROM ruby:3.1.2

# postgres
RUN apt-get update -y && apt-get install -y  postgresql-client  libpq-dev  --no-install-recommends && rm -rf /var/lib/apt/lists/*
ADD . /app
WORKDIR /app
RUN bundle install

#CMD bin/rails assets:precompile  &&  bundle exec puma -p 3000
CMD rm -f tmp/pids/server.pid && bin/rails assets:precompile && bundle exec rails s -p 3000 -b '0.0.0.0'