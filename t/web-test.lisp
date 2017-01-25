;;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-
(asdf:oos 'asdf:load-op :fiveam)

(defpackage web-test
  (:use :cl :fiveam :drakma :geohash :server)
  (:import-from :server))

(in-package :web-test)

(server:start-server)

(def-suite web-tests)

(in-suite web-tests)

(test get-localhost
  (let ((drakma:*header-stream* *standard-output*))
    (multiple-value-bind (body-or-stream status-code)
        (drakma:http-request "http://localhost:8080")
      (is (> (length body-or-stream) 0))
      (is (= 200 status-code)))))

(defun run-tests ()
  (5am:run! 'web-tests))

(run-tests)

(server:stop-server)

