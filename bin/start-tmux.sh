#!/bin/bash

check_required_programs() {

  if ! [ -x "$(command -v docker-compose)" ]; then
    echo 'Error: docker-compose is not installed.' >&2
    exit 1
  fi

  if ! [ -x "$(command -v docker)" ]; then
    echo 'Error: docker is not installed.' >&2
    exit 1
  fi

  if ! [ -x "$(command -v tmux)" ]; then
    echo 'Error: tmux is not installed.' >&2
    exit 1
  fi

}

echo "I'm about to spin up an instance of splunk enterprise with docker-compose and then start piping fake logs into it."

echo ""

check_required_programs

read -p "Press any key to continue, or ^C to cancel"

tmux new-session -d npm run start:splunk \; split-window npm run start:logs \; attach
