#!/bin/bash
SCRIPT_DIR=$(dirname $0)

docker build -t 'nro-extractor2' -f ${SCRIPT_DIR}/Dockerfile ${SCRIPT_DIR}
