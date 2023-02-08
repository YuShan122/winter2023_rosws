#include <ros/ros.h>
#include <geometry_msgs/Twist.h>
#include <turtlesim/Pose.h>

geometry_msgs::Twist goal_vel_msg;
turtlesim::Pose current_pose_msg;
ros::Publisher goal_vel_puber;
ros::Subscriber current_pose_suber;
double goal_pose_x, goal_pose_y, p_ctrl, p_ctrl_theta, max_err;
bool arrive;

void callbackfunction(const turtlesim::Pose::ConstPtr msg) {
    bool arrive_pre = arrive;
    double pose_err_x = goal_pose_x - msg->x;
    double pose_err_y = goal_pose_y - msg->y;
    if (abs(pose_err_x) < max_err && abs(pose_err_y) < max_err) {
        p_ctrl = 0;
        arrive = true;
        if (!arrive_pre) {
            ROS_INFO("arrive goal!\n");
        }
    }
    else {
        arrive = false;
    }
    goal_vel_msg.linear.x = p_ctrl * pose_err_x;
    goal_vel_msg.linear.y = p_ctrl * pose_err_y;
    goal_vel_msg.linear.z = 0;
    goal_vel_msg.angular.x = 0;
    goal_vel_msg.angular.y = 0;
    goal_vel_msg.angular.z = 0;
    goal_vel_puber.publish(goal_vel_msg);
}


int main(int argc, char** argv) {
    ros::init(argc, argv, "day6turtle");
    ros::NodeHandle nh;
    goal_vel_puber = nh.advertise<geometry_msgs::Twist>("goal_vel", 10);
    current_pose_suber = nh.subscribe("current_pose", 10, callbackfunction);

    nh.getParam("x", goal_pose_x);
    nh.getParam("y", goal_pose_y);
    nh.getParam("p", p_ctrl);
    max_err = 0.001;
    arrive = false;
    ROS_INFO("goal pose: x = %lf, y = %lf\n", goal_pose_x, goal_pose_y);
    ROS_INFO("   contrl: p = %lf\n", p_ctrl);

    while (ros::ok()) {
        ros::spinOnce();
    }

}