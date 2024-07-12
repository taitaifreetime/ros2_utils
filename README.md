# ROS2 Utilities
ROS2 utilities to make your work more efficient

## AUTO-README GENERATOR
- Generate README.md templete including topic, server, action, ros parameter descriptions by running ros2 commands.
```
# run your ros node

cd readme_generator
bash generate_readme.bash package_name /node_name > ~/path/to/package_name/README.md

# then modify
```
## Others
- Output all ros parameter belonging to *node_name*
```
bash rosparam_describe.bash /node_name
```

- Output all current ros parameter bleonging to *node_name*
```
bash rosparam_get.bash /node_name
```
