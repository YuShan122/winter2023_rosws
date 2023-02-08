;; Auto-generated. Do not edit!


(when (boundp 'comm::test)
  (if (not (find-package "COMM"))
    (make-package "COMM"))
  (shadow 'test (find-package "COMM")))
(unless (find-package "COMM::TEST")
  (make-package "COMM::TEST"))
(unless (find-package "COMM::TESTREQUEST")
  (make-package "COMM::TESTREQUEST"))
(unless (find-package "COMM::TESTRESPONSE")
  (make-package "COMM::TESTRESPONSE"))

(in-package "ROS")





(defclass comm::testRequest
  :super ros::object
  :slots (_a _b ))

(defmethod comm::testRequest
  (:init
   (&key
    ((:a __a) 0.0)
    ((:b __b) 0.0)
    )
   (send-super :init)
   (setq _a (float __a))
   (setq _b (float __b))
   self)
  (:a
   (&optional __a)
   (if __a (setq _a __a)) _a)
  (:b
   (&optional __b)
   (if __b (setq _b __b)) _b)
  (:serialization-length
   ()
   (+
    ;; float32 _a
    4
    ;; float32 _b
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _a
       (sys::poke _a (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _b
       (sys::poke _b (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _a
     (setq _a (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _b
     (setq _b (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass comm::testResponse
  :super ros::object
  :slots (_c ))

(defmethod comm::testResponse
  (:init
   (&key
    ((:c __c) 0.0)
    )
   (send-super :init)
   (setq _c (float __c))
   self)
  (:c
   (&optional __c)
   (if __c (setq _c __c)) _c)
  (:serialization-length
   ()
   (+
    ;; float32 _c
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _c
       (sys::poke _c (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _c
     (setq _c (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass comm::test
  :super ros::object
  :slots ())

(setf (get comm::test :md5sum-) "0e94547baedd4802a73be38202225d5a")
(setf (get comm::test :datatype-) "comm/test")
(setf (get comm::test :request) comm::testRequest)
(setf (get comm::test :response) comm::testResponse)

(defmethod comm::testRequest
  (:response () (instance comm::testResponse :init)))

(setf (get comm::testRequest :md5sum-) "0e94547baedd4802a73be38202225d5a")
(setf (get comm::testRequest :datatype-) "comm/testRequest")
(setf (get comm::testRequest :definition-)
      "float32 a
float32 b
---
float32 c
")

(setf (get comm::testResponse :md5sum-) "0e94547baedd4802a73be38202225d5a")
(setf (get comm::testResponse :datatype-) "comm/testResponse")
(setf (get comm::testResponse :definition-)
      "float32 a
float32 b
---
float32 c
")



(provide :comm/test "0e94547baedd4802a73be38202225d5a")


