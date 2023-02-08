
(cl:in-package :asdf)

(defsystem "comm-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "day4msg" :depends-on ("_package_day4msg"))
    (:file "_package_day4msg" :depends-on ("_package"))
  ))