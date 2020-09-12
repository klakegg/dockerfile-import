FROM ruby:2.7.1-slim-buster

ADD app /usr/lib/dockerfile-import

RUN echo "#!/bin/sh\n\nexec ruby /usr/lib/dockerfile-import/main.rb \$@" > /usr/bin/dockerfile-import \
 && chmod a+x /usr/bin/dockerfile-import \
 && ln -s dockerfile-import /usr/bin/dfi

WORKDIR /work

ENTRYPOINT ["dfi"]