# colcon_build
If you are a ROS user, you might have used ```catkin_build``` to build ROS packages. 
The build command can be used anywhere if you are inside a ros work space.
This guide allows you to use ```colcon_build``` to build your ROS 2 work space anywhere. 

## Usage
```
echo "source $(pwd)/colcon_build.bash" >> ~/.bashrc
source ~/.bashrc
cd /your_ros2_workspace/anywhere
colcon_build
```