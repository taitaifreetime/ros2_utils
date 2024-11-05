#!/bin/bash

# Usage: bash generate_readme.sh <title> <node_name1> <node_name2> ...

if [ "$#" -lt 2 ]; then
  echo "Usage: $0 <title> <node_name1> <node_name2> ..."
  exit 1
fi

title=$1
shift  # Remove the first argument (title) and shift all remaining arguments

echo "# $title"
echo "***THIS DOCUMENTATION WAS MADE AUTOMATICALLY***  "
echo "ROS2 package to do something"
echo "## :gear: Prepare"
echo "\`\`\`"
echo "\`\`\`"
echo "## :rocket: Getting Started"
echo "\`\`\`"
echo "\`\`\`"

# Iterate over each node name
for node_name in "$@"; do
  echo "## $node_name node"
  bash generate_topic_description.bash $node_name
  bash generate_param_description.bash $node_name
done

echo "## :books: Reference"
echo "- []()"