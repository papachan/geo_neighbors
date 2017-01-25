;;;; package-test.lisp

(defpackage :geohash-test
  (:use :cl :fiveam :geohash :server)
  (:export :run-tests))
