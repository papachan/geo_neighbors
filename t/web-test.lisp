;;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-
(asdf:oos 'asdf:load-op :fiveam)

(defpackage web-test
  (:use :cl :fiveam :drakma :geohash :server :cl-json)
  (:import-from :server))

(in-package :web-test)

(server:start-server)

(def-suite web-tests)

(in-suite web-tests)

(defvar *params* '(("lat" . 4.616335) ("lon" . -74.071275) ("zoom" . 6)))

(test test-get-localhost
  (let ((drakma:*header-stream* *standard-output*))
    (multiple-value-bind (body-or-stream status-code)
        (drakma:http-request "http://localhost:8080")
      (is (> (length body-or-stream) 0))
      (is (= 200 status-code)))))

(test test-post-geohash
  (let ((drakma:*header-stream* *standard-output*))
    (multiple-value-bind
          (body-or-stream status-code headers uri stream must-close reason-phrase)
        (drakma:http-request "http://localhost:8080/geohash"
                             :method :post
                             :content-type "application/json"
                             :content (json:encode-json-to-string *params*))
      (declare (ignore headers uri stream must-close))
      (is (> (length body-or-stream) 0))
      (is (= 200 status-code)))))

(defun run-tests ()
  (5am:run! 'web-tests))

(run-tests)

(server:stop-server)

