FROM ruby:2.5.3

ENV LANG C.UTF-8

RUN apt-get update -qq && \
    apt-get install -y build-essential nodejs rsync zip git

RUN mkdir /app
ENV APP_ROOT /app
WORKDIR $APP_ROOT

ADD ./app/Gemfile $APP_ROOT/Gemfile
ADD ./app/Gemfile.lock $APP_ROOT/Gemfile.lock

RUN bundle install
ADD ./app $APP_ROOT

RUN apt-get install -y unzip groff less
RUN curl "https://d1vvhvl2y92vvt.cloudfront.net/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install
RUN echo "alias aws=aws2" >> ~/.bashrc