#!/bin/bash

# add ros work spaces to be serached
ws_paths=("/ws1" "/ws2") 

# add path to ros
ros_path="/opt/ros/humble"

_roscd() {
    local cur prev
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    if [[ "$prev" == "roscd" ]]; then
        local pkg_list=""
        for ws in "${ws_paths[@]}"; do
            local ws_pkg_list=$(ls "$ws/src" 2>/dev/null | grep -v -e "install" -e "build" -e "log")
            pkg_list="$pkg_list $ws_pkg_list"
        done
        local root_pkg_list=$(ls "$ros_path/share")
        COMPREPLY=( $(compgen -W "$pkg_list $root_pkg_list" -- "$cur") )
        return 0
    fi
}
roscd() {
    local cd_path="$CDPATH"
    local found_pkg=false

    for ws in "${ws_paths[@]}"; do
        export CDPATH="$ws/src:$ros_path/share"
        if [ $# -eq 0 ]; then
            echo "Usage: roscd <package_name>"
        else
            local pkg_path="$ws/src/$1"
            local root_pkg_path="$ros_path/share/$1"
            if [ -e "$pkg_path" ]; then
                cd "$pkg_path"
                found_pkg=true
                break
            elif [ -e "$root_pkg_path" ]; then
                cd "$root_pkg_path"
                found_pkg=true
                break
            fi
        fi
    done
    
    if [ "$found_pkg" = false ]; then
        echo "No such package"
    fi

    export CDPATH="$cd_path"
}
complete -F _roscd roscd