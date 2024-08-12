#!/bin/bash

# Function to find the root of the ROS 2 workspace
find_workspace_root() {
    local current_dir="$PWD"
    while [ "$current_dir" != "/" ]; do
        if [ -d "$current_dir/src" ] && [ -f "$current_dir/colcon.meta" ] || [ "$(ls -A "$current_dir/src" 2>/dev/null)" ]; then
            echo "$current_dir"
            return 0
        fi
        current_dir=$(dirname "$current_dir")
    done
    echo "Error: Not inside a ROS 2 workspace."
    return 1
}

colcon_build() {
    # Find the workspace root
    ws_root=$(find_workspace_root)

    if [ $? -ne 0 ]; then
        echo "$ws_root"
        return 0
    fi

    # Navigate to the workspace root
    cd "$ws_root" 

    # Source the ROS 2 setup file
    source /opt/ros/humble/setup.bash

    # Run colcon build with the original arguments
    colcon build "$@"

    cd -
}