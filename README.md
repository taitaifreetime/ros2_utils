# ros2_utils
ROS 2 utilities to make your work more efficient

## auto_readme_generator
Automatically generates README.md. 

## roscd
Allows you to use ```roscd``` to find ROS 2 packages.

## cmd_vel_switcher
Switch cmd_vel topic. Refer to /joy topic to find which button is enabled.
#### Use Case
- If you implemented a path follower which publishes ```/your_planner/cmd_vel``` and if you have other cmd_vel, ```/joy/cmd_vel```, this node allows you to switch the two cmd_vel by pushing a button which is specified by trigger_index parameter.

## colcon_build
You can do ```colcon build``` anywhere.