#!/bin/bash

# Usage: bash generate_readme.sh node_name > README.md

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <node_name>"
  exit 1
fi

node_name=$1

# Check if node exists
ros2 node info $node_name >/dev/null 2>&1
if [ $? -ne 0 ]; then
  echo "Error: Node '$node_name' not found."
  exit 1
fi

output_topics() {
    topics=$1

    while IFS= read -r param; do
        local topic_name=$(echo "$param" | awk '{print $1}')
        local topic_type=$(echo "$param" | awk '{$1=""; print $0}' | sed 's/^[ \t]*//' | sed 's/ /, /')
        echo "- *\`$topic_name\`* ($topic_type)  "
    done <<< "$topics"
}

# Function to extract Subscribers and Publishers info and format the output
describe_subscribers_publishers() {
  local node=$1
  local info=$(ros2 node info $node | sed '1d')
  
  local action_clients=$(echo "$info" | sed -n '/Action Clients:/,$p')
  local action_servers=$(echo "$info" | sed -n '/Action Servers:/,$p' | sed '/Action Clients:/,$d' )
  local service_clients=$(echo "$info" | sed -n '/Service Clients:/,$p' | sed '/Action Servers:/,$d' )
  local service_servers=$(echo "$info" | sed -n '/Service Servers:/,$p' | sed '/Service Clients:/,$d' )
  local publishers=$(echo "$info" | sed -n '/Publishers:/,$p' | sed '/Service Servers:/,$d' )
  local subscribers=$(echo "$info" | sed -n '/Subscribers:/,$p' | sed '/Publishers:/,$d' )
  
  echo "## Required Topic"
  if [ -n "$(echo "$subscribers" | sed '1d')" ]; then
    output_topics "$(echo "$subscribers" | sed '1d')"
  fi

  echo "## Published Topic"
  if [ -n "$(echo "$publishers" | sed '1d')" ]; then
    output_topics "$(echo "$publishers" | sed '1d')"
  fi

  echo "## Service Server"
  if [ -n "$(echo "$service_servers" | sed '1d')" ]; then
    output_topics "$(echo "$service_servers" | sed '1d')"
  fi

  echo "## Service Client"
  if [ -n "$(echo "$service_clients" | sed '1d')" ]; then
    output_topics "$(echo "$service_clients" | sed '1d')"
  fi

  echo "## Action Server"
  if [ -n "$(echo "$action_servers" | sed '1d')" ]; then
    output_topics "$(echo "$action_servers" | sed '1d')"
  fi

  echo "## Action Client"
  if [ -n "$(echo "$action_clients" | sed '1d')" ]; then
    output_topics "$(echo "$action_clients" | sed '1d')"
  fi

  echo ""
}



# Generate README content for Subscribers and Publishers, excluding Service Servers
describe_subscribers_publishers $node_name