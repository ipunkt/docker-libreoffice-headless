#!/usr/bin/env bash

docker run --rm -it -v $(pwd):/tmp --name libreoffice-headless ipunkt/libreoffice-headless:latest --convert-to html "$@"