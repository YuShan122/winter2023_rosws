#include "ros/ros.h"
#include "geometry_msgs/Twist.h"
#include "turtlesim/Pose.h"


ros::Publisher pubVel;
ros::Subscriber subPose;
geometry_msgs::Twist msgVel;
turtlesim::Pose targetPose;

void callbackfunc(const turtlesim::Pose::ConstPtr& msg) {
    msgVel.linear.x = 1.0 * (targetPose.x - msg->x);
    msgVel.linear.y = 1.0 * (targetPose.y - msg->y);
    msgVel.linear.z = 0.0;
    msgVel.angular.x = 0.0;
    msgVel.angular.y = 0.0;
    msgVel.angular.z = 0.0;
    if (abs(msgVel.linear.x) < 0.01) msgVel.linear.x = 0.0;
    if (abs(msgVel.linear.y) < 0.01) msgVel.linear.y = 0.0;
}

int main(int argc, char** argv) {
    ros::init(argc, argv, "velContrl");
    ros::NodeHandle nh;
    pubVel = nh.advertise<geometry_msgs::Twist>("turtle1/cmd_vel", 10);
    subPose = nh.subscribe("turtle1/pose", 10, callbackfunc);
    targetPose.x = 10.0;
    targetPose.y = 0.0;
    targetPose.theta = 0.0;

    while (ros::ok()) {
        ros::spinOnce();
        pubVel.publish(msgVel);
    }

    return 0;
}