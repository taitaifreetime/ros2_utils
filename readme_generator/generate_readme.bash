#!/bin/bash

# Usage: bash generate_readme.sh title node_name > README.md

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <title> <node_name>"
  exit 1
fi

title=$1
node_name=$2

echo "# $title"
bash generate_topic_description.bash $node_name
bash generate_param_description.bash $node_name