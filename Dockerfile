FROM ruby:3.1.2

# postgres
RUN apt-get update -y && apt-get install -y  postgresql-client  libpq-dev  --no-install-recommends && rm -rf /var/lib/apt/lists/*

ADD . /app
WORKDIR /app
RUN bundle install

#EXPOSE 3000

#CMD bin/rails assets:precompile  &&  bundle exec puma -p 3000
CMD ["bash"]
