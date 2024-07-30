#!/bin/bash

# add ros work space to be serached
ws_path="/your_ws"

# add path to ros
ros_path="/opt/ros/humble"

_roscd() {
    local cur prev
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    if [[ "$prev" == "roscd" ]]; then
        local pkg_list=$(ls $ws_path/src | grep -v -e "install" -e "build" -e "log")
        local root_pkg_list=$(ls $ros_path/share)
        COMPREPLY=( $(compgen -W "$pkg_list $root_pkg_list" -- "$cur") )
        return 0
    fi
}
roscd() {
    local cd_path="$CDPATH"
    export CDPATH="$ws_path/src:$ros_path/share"
    if [ $# -eq 0 ]; then
        echo "Usage: roscd <package_name>"
    else
        local pkg_path="$ws_path/src/$1"
        local root_pkg_path="$ros_path/share/$1"
        if [ -e "$pkg_path" ]; then
            cd "$pkg_path"
        elif [ -e "$root_pkg_path" ]; then
            cd "$root_pkg_path"
        else
            echo "No such package"
        fi
    fi
    export CDPATH="$cd_path"
}
complete -F _roscd roscd
