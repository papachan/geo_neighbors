;;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-
(asdf:oos 'asdf:load-op :fiveam)
;; (asdf:oos 'asdf:test-op :geo_neighbors-test)

(defpackage web-test
  (:use :cl :fiveam :drakma :server)
  (:import :server))

(in-package :web-test)

(def-suite web-tests)

(in-suite web-tests)

(server:start-server)

(test server-test
  "test server response"
  (drakma:http-request "http://localhost:8080/"))

(defun run-tests ()
  (5am:run! 'web-tests))

(run-tests)

(server:stop-server)

