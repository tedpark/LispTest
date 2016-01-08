(in-package :cl-user)
(defpackage cave-test-asd
  (:use :cl :asdf))
(in-package :cave-test-asd)

(defsystem cave-test
  :author "ted"
  :license ""
  :depends-on (:cave
               :prove)
  :components ((:module "t"
                :components
                ((:file "cave"))))
  :perform (load-op :after (op c) (asdf:clear-system c)))
