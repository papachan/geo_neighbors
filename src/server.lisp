;;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-

(defpackage :server
  (:use :cl :hunchentoot :cl-who :geohash :cl-json)
  (:import-from :geohash
                :encode)
  (:import-from :hunchentoot
                :define-easy-handler
                :easy-acceptor)
  (:import-from :cl-json
                :json-bind
                :decode-json-from-string)
  (:export :start-server
           :stop-server))
(in-package :server)

(defvar *web-server* nil)

(defun path (filename)
   (asdf:system-relative-pathname :geo_neighbors filename))

(setf *js-string-delimiter* #\")

(defun slurp-stream(stream)
  ;; Credit: http://www.emmett.ca/~sabetts/slurp.html
  (let ((seq (make-string (file-length stream))))
    (read-sequence seq stream)
    seq))

(define-easy-handler (home :uri "/") ()
  (setf (hunchentoot:content-type*) "text/html")
  ;; We have to select the folder application
  (with-open-file (stream (path "public/index.html") :direction :input)
    (slurp-stream stream)))

(define-easy-handler (hosts-handler :uri "/geohash") ()
  (setf (hunchentoot:content-type*) "application/json")
  (let* ((raw-data (hunchentoot:raw-post-data :force-text t)))
    (json-bind (lat lon zoom) raw-data
      (format nil "{\"data\":\"~a\"}"
              (encode lat lon (utils::convert_scale zoom))))))

(defun stop-server ()
  (when *web-server*
    (hunchentoot:stop *web-server*)
    (setf *web-server* nil)))

(defun start-server (&key (port 8080))
  (setf *web-server* (make-instance 'easy-acceptor :address "localhost"
                                            :port port
                                            :document-root "public/"))
  (hunchentoot:start *web-server*)
  (format t "~& ;; Starting web server on localhost:~A." port))


