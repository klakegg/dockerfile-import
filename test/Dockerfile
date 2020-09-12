IMPORT imports/hello-world AS hello-world


FROM alpine:3.12

IMPORT includes/make

COPY --from=hello-world / /

CMD cat /hello-world.txt