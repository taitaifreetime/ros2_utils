# roscd
If you are a ROS user, you might have used ```roscd``` to find ROS packages. This guide allows you to use ```roscd``` for ROS 2. This command can find ROS 2 packages that have not yet been built.

## Before Use
Change 3-7 lines 
```
# add ros work space to be serached
ws_path="your_ws"

# add path to ros
ros_path="/opt/ros/humble"
```

## Usage
```
echo "source $(pwd)/roscd.bash" >> ~/.bashrc
source ~/.bashrc
roscd your_ros2_pkg!
```