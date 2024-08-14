FROM ruby:3.1

RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    build-essential \
    postgresql-client \
    git \
    curl \
    libpq-dev \
    unixodbc-dev \
    libpq5

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN gem install ruby-odbc && bundle install

COPY . .

COPY entrypoint.sh /usr/bin/

RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]

#FROM ruby:3.2.2-slim-bullseye as builder
#
#ARG BUNDLE_GITHUB__COM
#
#RUN bundle config --local --delete-all
#RUN bundle config --local GITHUB__COM x-access-token:$BUNDLE_GITHUB__COM
#
#FROM ruby:3.2.2-slim-bullseye
#
#RUN apt-get update -qq && \
#    apt-get install -y --no-install-recommends \
#    build-essential \
#    postgresql-client \
#    git \
#    curl \
#    libpq-dev \
#    unixodbc-dev \
#    libpq5
#
#WORKDIR /app
#
#COPY --from=builder /usr/local/bundle/config /usr/local/bundle/config
#
#COPY Gemfile* ./
#
#RUN gem install ruby-odbc -v '0.999991' && bundle install --jobs 4 --retry 3
#
#COPY . .
#
#COPY entrypoint.sh /usr/bin/
#RUN chmod +x /usr/bin/entrypoint.sh
#
#ENTRYPOINT ["entrypoint.sh"]
#
#EXPOSE 3000
#
#CMD ["rails", "server", "-b", "0.0.0.0"]
