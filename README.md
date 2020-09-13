# Dockerfile Import

Introduces the instruction `IMPORT` for preprocessing of Dockerfiles.

Syntax:
```
IMPORT <file> [AS <name>]
```

Import without `name` will import the referenced file without any modifications.

Import with `name` will update instances of `COPY` and `FROM` by prefixing the name when relevant.

Imported files may include further import instructions relative to the imported file.

To build your image using import instructions, simply preprocess your Dockerfile:

```bash
# Preprocess dockerfile
docker run --rm -it \
    -v $(pwd):/work \
    -u $(id -u) \
    klakegg/dockerfile-import \
    Dockerfile Dockerfile-imported

# Build as usual with the preprocessed file
docker build -t mytag -f Dockerfile-imported .
```