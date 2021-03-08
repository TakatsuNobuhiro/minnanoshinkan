FROM ruby:2.7
RUN apt-get update -qq && apt-get install -y nodejs yarnpkg
RUN apt update && apt install -y lsb-release \
    && apt remove -y libmariadb-dev-compat libmariadb-dev

RUN wget https://dev.mysql.com/get/Downloads/MySQL-8.0/mysql-common_8.0.18-1debian10_amd64.deb \
    https://dev.mysql.com/get/Downloads/MySQL-8.0/libmysqlclient21_8.0.18-1debian10_amd64.deb \
    https://dev.mysql.com/get/Downloads/MySQL-8.0/mysql-community-client-core_8.0.18-1debian10_amd64.deb \
    https://dev.mysql.com/get/Downloads/MySQL-8.0/mysql-community-client_8.0.18-1debian10_amd64.deb \
    https://dev.mysql.com/get/Downloads/MySQL-8.0/libmysqlclient-dev_8.0.18-1debian10_amd64.deb

RUN dpkg -i mysql-common_8.0.18-1debian10_amd64.deb \
    libmysqlclient21_8.0.18-1debian10_amd64.deb \
    mysql-community-client-core_8.0.18-1debian10_amd64.deb \
    mysql-community-client_8.0.18-1debian10_amd64.deb \
    libmysqlclient-dev_8.0.18-1debian10_amd64.deb

RUN ln -s /usr/bin/yarnpkg /usr/bin/yarn
RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]