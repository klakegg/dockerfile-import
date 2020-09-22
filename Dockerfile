FROM ruby:2.7.1-slim-buster AS source

ADD . /work

RUN test -e /work/dockerfile-import.gem || gem build /work/dockerfile-import.gemspec -C /work --output=dockerfile-import.gem


FROM ruby:2.7.1-slim-buster

COPY --from=source /work/dockerfile-import.gem /

RUN gem install /dockerfile-import.gem

WORKDIR /work

ENTRYPOINT ["dockerfile-import"]