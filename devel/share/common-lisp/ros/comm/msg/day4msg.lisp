; Auto-generated. Do not edit!


(cl:in-package comm-msg)


;//! \htmlinclude day4msg.msg.html

(cl:defclass <day4msg> (roslisp-msg-protocol:ros-message)
  ((time
    :reader time
    :initarg :time
    :type cl:float
    :initform 0.0)
   (positon
    :reader positon
    :initarg :positon
    :type geometry_msgs-msg:Twist
    :initform (cl:make-instance 'geometry_msgs-msg:Twist))
   (velocity
    :reader velocity
    :initarg :velocity
    :type geometry_msgs-msg:Twist
    :initform (cl:make-instance 'geometry_msgs-msg:Twist)))
)

(cl:defclass day4msg (<day4msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <day4msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'day4msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name comm-msg:<day4msg> is deprecated: use comm-msg:day4msg instead.")))

(cl:ensure-generic-function 'time-val :lambda-list '(m))
(cl:defmethod time-val ((m <day4msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader comm-msg:time-val is deprecated.  Use comm-msg:time instead.")
  (time m))

(cl:ensure-generic-function 'positon-val :lambda-list '(m))
(cl:defmethod positon-val ((m <day4msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader comm-msg:positon-val is deprecated.  Use comm-msg:positon instead.")
  (positon m))

(cl:ensure-generic-function 'velocity-val :lambda-list '(m))
(cl:defmethod velocity-val ((m <day4msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader comm-msg:velocity-val is deprecated.  Use comm-msg:velocity instead.")
  (velocity m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <day4msg>) ostream)
  "Serializes a message object of type '<day4msg>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'positon) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'velocity) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <day4msg>) istream)
  "Deserializes a message object of type '<day4msg>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'time) (roslisp-utils:decode-single-float-bits bits)))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'positon) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'velocity) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<day4msg>)))
  "Returns string type for a message object of type '<day4msg>"
  "comm/day4msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'day4msg)))
  "Returns string type for a message object of type 'day4msg"
  "comm/day4msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<day4msg>)))
  "Returns md5sum for a message object of type '<day4msg>"
  "4febcd00129bcc42354cebe4c20dacb3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'day4msg)))
  "Returns md5sum for a message object of type 'day4msg"
  "4febcd00129bcc42354cebe4c20dacb3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<day4msg>)))
  "Returns full string definition for message of type '<day4msg>"
  (cl:format cl:nil "float32 time~%geometry_msgs/Twist positon~%geometry_msgs/Twist velocity~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'day4msg)))
  "Returns full string definition for message of type 'day4msg"
  (cl:format cl:nil "float32 time~%geometry_msgs/Twist positon~%geometry_msgs/Twist velocity~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <day4msg>))
  (cl:+ 0
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'positon))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'velocity))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <day4msg>))
  "Converts a ROS message object to a list"
  (cl:list 'day4msg
    (cl:cons ':time (time msg))
    (cl:cons ':positon (positon msg))
    (cl:cons ':velocity (velocity msg))
))
