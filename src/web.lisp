(in-package :cl-user)
(defpackage cave.web
  (:use :cl
        :caveman2
        :cave.config
        :cave.view
        :cave.db
        :datafly
        :sxql)
  (:export :*web*))
(in-package :cave.web)

;; for @route annotation
(syntax:use-syntax :annot)

;;
;; Application

(defclass <web> (<app>) ())
(defvar *web* (make-instance '<web>))
(clear-routing-rules *web*)

;;
;; Routing rules

(defroute "/" ()
  (render #P"index.html"))


(defroute "/asdf" ()
  (format nil "HElle123"))


(defroute "/qwer" ()
;;(let ((person (find-person-from-db |id|)))
  ;;(let (person (1 2 3)))
  ;;(format nil "Hello,"))
  ;;(render-json (:"name" "Eitaro Fukamachi" :"email" "e.arrows@gmail.com")))
  (render-json '(("commentid" . 4) ("commentauthor" . "liuyan") ("commenttext" . "testcomment"))))


;;
;; qwer pages

(defmethod on-exception ((app <web>) (code (eql 404)))
  (declare (ignore app))
  (merge-pathnames #P"_errors/404.html"
                   *template-directory*))
