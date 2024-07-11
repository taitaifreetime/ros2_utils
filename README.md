# ROS2 Command Utilities

## README Auto-Generator
```
# run your ros node
cd readme_generator
bash generate_readme.bash package_name node_name > README.md
# then modify
```
### Sub features
- Output all ros parameter belonging to *node_name*
```
bash rosparam_describe.bash node_name
```

- Output all current ros parameter bleonging to *node_name*
```
bash rosparam_get.bash node_name
```

- ros parameter description auto-generator
```
bash generate_param_description.bash node_name > param_description.md
```

- ros topic description auto-generator
```
bash generate_topic_description.bash node_name > topic_description.md
```