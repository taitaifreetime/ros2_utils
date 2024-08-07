import rclpy
from rclpy.node import Node
from sensor_msgs.msg import Joy
from geometry_msgs.msg import Twist
from rcl_interfaces.msg import ParameterDescriptor


class CmdVelBridge(Node):
    def __init__(self):
        super().__init__('cmd_vel_switcher')

        trigger_config = ParameterDescriptor()
        trigger_config.description = "switch cmd_vel according to this index button"
        self.declare_parameter('trigger_index', 11, trigger_config)
        self.trigger_index_ = self.get_parameter('trigger_index').get_parameter_value().integer_value

        self.current_mode_ = True # publish cmd_vel1_
        self.trigger_button_ = False 
        self.cmd_vel1_ = Twist()
        self.cmd_vel2_ = Twist()
        self.cmd_vel_ = Twist()
        self.sub_joy_ = self.create_subscription(Joy, 'joy', self.joy_callback, 1)
        self.sub_vel1_ = self.create_subscription(Twist, '/input_cmd_vel1', self.vel1_callback, 1)
        self.sub_vel2_ = self.create_subscription(Twist, '/input_cmd_vel2', self.vel2_callback, 1)
        self.pub_vel_ = self.create_publisher(Twist, '/output_cmd_vel', 10)
        

        self.get_logger().info('trigger_index: {}'.format(self.trigger_index_))
        self.get_logger().warning('cmd_vel_switcher start!!\n')

    def joy_callback(self, msg):
        """
        switch cmd_vel according to self.current_mode

        Args:
            msg (sensor_msgs.msg.Joy): /joy
        """

        # self.get_logger().info('{}'.format(msg))
        if msg.buttons[self.trigger_index_] and not self.trigger_button_:
            self.current_mode_ = not self.current_mode_
            self.get_logger().info('cmd_vel mode: {}'.format(self.current_mode_))
        
        self.trigger_button_ = msg.buttons[self.trigger_index_]

    def vel1_callback(self, msg):
        """
        publish 1st cmd_vel resource if current_mode == true 

        Args:
            msg (geometry_msgs.msg.Twist): cmd_vel1
        """

        if self.current_mode_:
            self.pub_vel_.publish(msg)

    def vel2_callback(self, msg):
        """
        publish 2nd cmd_vel resource if current_mode == false 

        Args:
            msg (geometry_msgs.msg.Twist): cmd_vel2
        """

        if not self.current_mode_:
            self.pub_vel_.publish(msg)


def main(args=None):
    rclpy.init(args=args)
    cmd_vel_switcher=CmdVelBridge()
    rclpy.spin(cmd_vel_switcher)

    cmd_vel_switcher.destroy_node()
    rclpy.shutdown()



if __name__ == '__main__':
    main()
