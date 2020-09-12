IMPORT imports/hello-world AS hello-world


FROM alpine:3.12

INCLUDE includes/make

COPY --from=hello-world / /

CMD cat /hello-world.txt