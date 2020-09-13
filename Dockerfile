FROM ruby:2.7.1-slim-buster AS source

ADD app /files/usr/lib/dockerfile-import
ADD Gemfile Gemfile.lock LICENSE /files/usr/lib/dockerfile-import/

RUN mkdir -p /files/usr/bin \
 && echo "#!/bin/sh\n\nexec ruby /usr/lib/dockerfile-import/main.rb \$@" > /files/usr/bin/dockerfile-import \
 && chmod a+x /files/usr/bin/dockerfile-import \
 && ln -sf dockerfile-import /files/usr/bin/dfi


FROM ruby:2.7.1-slim-buster

COPY --from=source /files /

WORKDIR /work

ENTRYPOINT ["dfi"]