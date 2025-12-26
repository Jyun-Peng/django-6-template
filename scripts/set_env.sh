#/bin/bash

# set env values from config .env file
export $(grep -v '^#' config/.env | xargs)