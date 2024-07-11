#!/bin/bash

# Usage: bash generate_readme.sh node_name > README.md

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <node_name>"
  exit 1
fi

node_name=$1

params=$(ros2 param list /$node_name)

# Function to extract parameter details and format the output
describe_param() {
  local node=$1
  local param=$2
  local description=$(ros2 param describe /$node $param | sed 's/^ *//')

  local param_type=$(echo "$description" | grep 'Type:' | awk '{print $2}')
  local param_description=$(echo "$description" | grep 'Description:' | sed 's/Description://')
  
  # Extract constraints information
  local constraints=$(echo "$description" | grep -A 4 'Constraints:' | sed 's/Constraints:/\*\*Constraints\*\*:/' | sed 's/^ *//')
  local additional_constraints=$(echo "$constraints" | grep 'Additional constraints:' | awk '{for (i=3; i<=NF; i++) printf "%s ", $i; printf "\n"}')
  local read_only=$(echo "$constraints" | grep 'Read only:' | awk '{print $3}')
  local dynamic_typing=$(echo "$constraints" | grep 'Dynamic typing:' | awk '{print $3}')

  echo "- *\`$param\`* ($param_type, default: )  "
  echo "  **Description**: $param_description  "
  
  # Print additional constraints if present
  if [ -n "$additional_constraints" ]; then
    echo "  **Additional Constraints**: $additional_constraints"
  fi

  # Print read_only if present
  if [ -n "$read_only" ]; then
    echo "  **Read Only**: $read_only"
  fi

  # Print dynamic_typing if present
  if [ -n "$dynamic_typing" ]; then
    echo "  **Dynamic Typing**: $dynamic_typing"
  fi


  echo ""
}

# Print the header for README
echo "## Required Param"
echo ""

# Iterate over each parameter and describe it
for param in $params
do
  describe_param $node_name $param
done