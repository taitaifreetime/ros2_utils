# sample_README
***THIS DOCUMENTATION WAS MADE AUTOMATICALLY***  
ROS2 package to do something
## Usage
```
```
## /cmd_vel_switcher node
### Required Topic
- *`/joy:`* (sensor_msgs/msg/Joy)  
- *`/joy/cmd_vel:`* (geometry_msgs/msg/Twist)  
- *`/your_planner/cmd_vel:`* (geometry_msgs/msg/Twist)  
### Published Topic
- *`/out/cmd_vel:`* (geometry_msgs/msg/Twist)  
- *`/parameter_events:`* (rcl_interfaces/msg/ParameterEvent)  
- *`/rosout:`* (rcl_interfaces/msg/Log)  
### Service Server
- *`/cmd_vel_switcher/describe_parameters:`* (rcl_interfaces/srv/DescribeParameters)  
- *`/cmd_vel_switcher/get_parameter_types:`* (rcl_interfaces/srv/GetParameterTypes)  
- *`/cmd_vel_switcher/get_parameters:`* (rcl_interfaces/srv/GetParameters)  
- *`/cmd_vel_switcher/list_parameters:`* (rcl_interfaces/srv/ListParameters)  
- *`/cmd_vel_switcher/set_parameters:`* (rcl_interfaces/srv/SetParameters)  
- *`/cmd_vel_switcher/set_parameters_atomically:`* (rcl_interfaces/srv/SetParametersAtomically)  
### Service Client
### Action Server
### Action Client

### Required Param
- *`trigger_index`* (integer, default: )  
  **Description**:  switch cmd_vel according to this index button  

- *`use_sim_time`* (boolean, default: )  
  **Description**:   

## /jtop node
### Required Topic
### Published Topic
- *`/jtop:`* (jtop_orinnx_msgs/msg/Jtop)  
- *`/parameter_events:`* (rcl_interfaces/msg/ParameterEvent)  
- *`/rosout:`* (rcl_interfaces/msg/Log)  
### Service Server
- *`/jtop/describe_parameters:`* (rcl_interfaces/srv/DescribeParameters)  
- *`/jtop/get_parameter_types:`* (rcl_interfaces/srv/GetParameterTypes)  
- *`/jtop/get_parameters:`* (rcl_interfaces/srv/GetParameters)  
- *`/jtop/list_parameters:`* (rcl_interfaces/srv/ListParameters)  
- *`/jtop/set_parameters:`* (rcl_interfaces/srv/SetParameters)  
- *`/jtop/set_parameters_atomically:`* (rcl_interfaces/srv/SetParametersAtomically)  
### Service Client
### Action Server
### Action Client

### Required Param
- *`interval`* (double, default: )  
  **Description**:  jtop frequency in seconds  

- *`max_num_cpus`* (integer, default: )  
  **Description**:  the number pf cpu cores (e.g. 8 cores for Jetson Orin NX 16GB)  

- *`use_sim_time`* (boolean, default: )  
  **Description**:   

