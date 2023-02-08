#include <ros/ros.h>
#include <comm/test.h>

bool add_callback(comm::test::Request& req, comm::test::Response& res) {
    res.c = req.a + req.b;
    std::cout << "The server responsed\n";
    return true;

}

int main(int argc, char** argv) {
    ros::init(argc, argv, "add_server");
    ros::NodeHandle nh;
    ros::ServiceServer server = nh.advertiseService("add_two_number", add_callback);
    while (ros::ok()) {
        std::cout << "Waiting to add\n";
        ros::spin();
    }
    return 0;
}