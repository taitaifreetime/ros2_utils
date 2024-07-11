# ROS2 Command Utilities

## Output all ros parameter belonging to *node_name*
```
bash rosparam_describe.bash node_name
```

## Output all current ros parameter bleonging to *node_name*
```
bash rosparam_get.bash node_name
```

## Auto generate README.md templete for ros parameter description
```
bash generate_readme.bash node_name > required_param.md
# then fill out default values and modify
```