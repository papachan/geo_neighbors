;;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-
(asdf:oos 'asdf:load-op :fiveam)

(defpackage gehoash-test
  (:use :cl :fiveam :geohash)
  (:export :run-tests))

(in-package #:geohash-test)

(def-suite geohash)

(in-suite geohash)

(test geocodehash-test
  "test Encode Geohash from latitude longitude"
  (is (equal (geohash::enc 35.7101389 139.8108333 8) "xn77jkz4"))
  (is (equal (geohash::enc 4.616335 -74.071275 6) "d2g662")))

(defun run-tests ()
  (5am:run! 'geohash))

(run-tests)
