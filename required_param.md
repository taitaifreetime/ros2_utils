## Required Param

- *`angle_max`* (double, default: )  
  **Description**:  max angle in a horizontal direction to obstacle to be detected  

- *`angle_min`* (double, default: )  
  **Description**:  min angle in a horizontal direction to obstacle to be detected  

- *`cluster_angle_tolerance`* (double, default: )  
  **Description**:  gap between two obstacles in a horizontal direction  
  **Additional Constraints**: highly depending on situation (e.g. large number under the situation that there are many obstacles) 

- *`cluster_dist_tolerance`* (double, default: )  
  **Description**:  gap between two obstacles in a radial direction  
  **Additional Constraints**: highly depending on situation (e.g. large number under the situation that there are many obstacles) 

- *`cluster_points`* (integer, default: )  
  **Description**:  clustering an obstacle  
  **Additional Constraints**: resolution of laserscan, ma_interval and cluster_points highly depend on each other 

- *`ma_interval`* (integer, default: )  
  **Description**:  ave of ma_interval samples for moving average pre-process  
  **Additional Constraints**: resolution of laserscan, ma_interval and cluster_points highly depend on each other 

<!-- - *`qos_overrides./parameter_events.publisher.depth`* (integer, default: )  
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
  **Read Only**: true -->

- *`range_max`* (double, default: )  
  **Description**:  max distance from lasescan frame to obstacle to be detected  

- *`range_min`* (double, default: )  
  **Description**:  min distance from sensor frame to obstacle to be detected  

- *`target_frame`* (string, default: )  
  **Description**:  transform obstacles frame from laserscan frame to target_frame  

<!-- - *`use_sim_time`* (boolean, default: )  
  **Description**:    -->

