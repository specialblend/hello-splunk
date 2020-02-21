#!/bin/bash

NOW=$(date +%F-%H-%M-%S)
OUTPUT_FILE="logs/${NOW}.log"

mkdir -p logs

echo "I'm gonna start piping fake logs into ${OUTPUT_FILE}"

docker run -it --rm mingrammer/flog -l -d 0.01 -s 1 | tee -a ${OUTPUT_FILE}
