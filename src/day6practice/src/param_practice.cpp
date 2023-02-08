#include <ros/ros.h>

int main(int argc, char** argv) {

    ros::init(argc, argv, "/param_practice");
    ros::NodeHandle nh;
    double freq;
    double vel;

    while (ros::ok()) {

        nh.getParam("print_freq", freq);
        ros::Rate rate(freq);
        ROS_INFO("%f", freq);
        nh.getParam("param_practice/param", vel);
        ROS_INFO("%f", vel);
        rate.sleep();

    }
    return 0;
}