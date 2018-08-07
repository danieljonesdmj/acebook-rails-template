FROM ruby:2.5.0

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Set an environment variable where the Rails app is installed to inside of Docker image
RUN mkdir -p ./ruffbook

# Set working directory
WORKDIR ./ruffbook

# Setting env up
ENV RAILS_ENV='production'
ENV RAKE_ENV='production'

# Adding gems
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install --jobs 20 --retry 5 --without development test

# Adding project files
COPY . .
RUN bundle exec rake assets:precompile
EXPOSE 3000
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
