#!/bin/bash

# how to use
# bash rosparam_get node_name

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <node_name>"
  exit 1
fi

node_name=$1

params=$(ros2 param list /$node_name)

for param in $params
do
  echo "$param"
  ros2 param get /$node_name $param
  echo ""
done
