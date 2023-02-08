#!/usr/bin/env python3

import rospy

rospy.init_node('hello_python_node')

while not rospy.is_shutdown():
    rospy.loginfo('hello world')
    rospy.sleep(1)


    