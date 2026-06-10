#!/bin/bash

set -e

cd "$(dirname "$0")"

case "$1" in
  build_generator)
    docker build -t csv-generator ./generator
    ;;

  run_generator)
    mkdir -p data
    docker run --rm -v "$(pwd)/data:/data" csv-generator
    ;;

  create_local_data)
    mkdir -p local_data
    python generator/generate.py local_data
    ;;

  build_reporter)
    docker build -t csv-reporter ./reporter
    ;;

  run_reporter)
    mkdir -p data
    docker run --rm -v "$(pwd)/data:/data" csv-reporter
    ;;

  structure)
    find . -maxdepth 3 -print
    ;;

  clear_data)
    mkdir -p data
    rm -f data/*.csv data/*.html
    echo "Data cleared."
    ;;

  inside_generator)
    mkdir -p data
    docker run --rm -v "$(pwd)/data:/data" csv-generator ls -la /data
    ;;

  inside_reporter)
    mkdir -p data
    docker run --rm -v "$(pwd)/data:/data" csv-reporter ls -la /data
    ;;

  report_server)
    docker run --rm -p 8080:80 -v "$(pwd)/data:/usr/local/apache2/htdocs:ro" httpd:2.4
    ;;

  *)
    echo "unknown command"
    exit 1
    ;;
esac