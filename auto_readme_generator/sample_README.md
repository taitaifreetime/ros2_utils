# rviz
***THIS DOCUMENTATION WAS MADE AUTOMATICALLY***  
ROS2 package to do something
## :gear: Prepare
```
```
## :rocket: Getting Started
```
```
## /rviz node
### Required Topic
- *`/parameter_events:`* (rcl_interfaces/msg/ParameterEvent)  
### Published Topic
- *`/clicked_point:`* (geometry_msgs/msg/PointStamped)  
- *`/goal_pose:`* (geometry_msgs/msg/PoseStamped)  
- *`/initialpose:`* (geometry_msgs/msg/PoseWithCovarianceStamped)  
- *`/parameter_events:`* (rcl_interfaces/msg/ParameterEvent)  
- *`/rosout:`* (rcl_interfaces/msg/Log)  
### Service Server
- *`/rviz/describe_parameters:`* (rcl_interfaces/srv/DescribeParameters)  
- *`/rviz/get_parameter_types:`* (rcl_interfaces/srv/GetParameterTypes)  
- *`/rviz/get_parameters:`* (rcl_interfaces/srv/GetParameters)  
- *`/rviz/list_parameters:`* (rcl_interfaces/srv/ListParameters)  
- *`/rviz/set_parameters:`* (rcl_interfaces/srv/SetParameters)  
- *`/rviz/set_parameters_atomically:`* (rcl_interfaces/srv/SetParametersAtomically)  
### Service Client
### Action Server
### Action Client

### Required Param
- *`qos_overrides./parameter_events.publisher.depth`* (integer, default: )  
  **Description**:  qos policy {depth} for publisher {/parameter_events}  
  **Read Only**: true

- *`qos_overrides./parameter_events.publisher.durability`* (string, default: )  
  **Description**:  qos policy {durability} for publisher {/parameter_events}  
  **Read Only**: true

- *`qos_overrides./parameter_events.publisher.history`* (string, default: )  
  **Description**:  qos policy {history} for publisher {/parameter_events}  
  **Read Only**: true

- *`qos_overrides./parameter_events.publisher.reliability`* (string, default: )  
  **Description**:  qos policy {reliability} for publisher {/parameter_events}  
  **Read Only**: true

- *`tf_buffer_cache_time_ms`* (integer, default: )  
  **Description**:  Configure the rviz tf buffer cache time [ms].  
  **Read Only**: true

- *`use_sim_time`* (boolean, default: )  
  **Description**:   

## :books: Reference
- []()
