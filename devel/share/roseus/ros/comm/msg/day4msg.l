;; Auto-generated. Do not edit!


(when (boundp 'comm::day4msg)
  (if (not (find-package "COMM"))
    (make-package "COMM"))
  (shadow 'day4msg (find-package "COMM")))
(unless (find-package "COMM::DAY4MSG")
  (make-package "COMM::DAY4MSG"))

(in-package "ROS")
;;//! \htmlinclude day4msg.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass comm::day4msg
  :super ros::object
  :slots (_time _positon _velocity ))

(defmethod comm::day4msg
  (:init
   (&key
    ((:time __time) 0.0)
    ((:positon __positon) (instance geometry_msgs::Twist :init))
    ((:velocity __velocity) (instance geometry_msgs::Twist :init))
    )
   (send-super :init)
   (setq _time (float __time))
   (setq _positon __positon)
   (setq _velocity __velocity)
   self)
  (:time
   (&optional __time)
   (if __time (setq _time __time)) _time)
  (:positon
   (&rest __positon)
   (if (keywordp (car __positon))
       (send* _positon __positon)
     (progn
       (if __positon (setq _positon (car __positon)))
       _positon)))
  (:velocity
   (&rest __velocity)
   (if (keywordp (car __velocity))
       (send* _velocity __velocity)
     (progn
       (if __velocity (setq _velocity (car __velocity)))
       _velocity)))
  (:serialization-length
   ()
   (+
    ;; float32 _time
    4
    ;; geometry_msgs/Twist _positon
    (send _positon :serialization-length)
    ;; geometry_msgs/Twist _velocity
    (send _velocity :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _time
       (sys::poke _time (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; geometry_msgs/Twist _positon
       (send _positon :serialize s)
     ;; geometry_msgs/Twist _velocity
       (send _velocity :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _time
     (setq _time (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; geometry_msgs/Twist _positon
     (send _positon :deserialize buf ptr-) (incf ptr- (send _positon :serialization-length))
   ;; geometry_msgs/Twist _velocity
     (send _velocity :deserialize buf ptr-) (incf ptr- (send _velocity :serialization-length))
   ;;
   self)
  )

(setf (get comm::day4msg :md5sum-) "4febcd00129bcc42354cebe4c20dacb3")
(setf (get comm::day4msg :datatype-) "comm/day4msg")
(setf (get comm::day4msg :definition-)
      "float32 time
geometry_msgs/Twist positon
geometry_msgs/Twist velocity
================================================================================
MSG: geometry_msgs/Twist
# This expresses velocity in free space broken into its linear and angular parts.
Vector3  linear
Vector3  angular

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
")



(provide :comm/day4msg "4febcd00129bcc42354cebe4c20dacb3")


