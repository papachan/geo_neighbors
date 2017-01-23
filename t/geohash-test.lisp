;;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-
(asdf:oos 'asdf:load-op :fiveam)

(defpackage gehoash-test
  (:use :cl :fiveam :geohash)
  (:import-from :geohash)
  (:export :run-tests))

(in-package #:geohash-test)

(def-suite geohash)

(in-suite geohash)

(test encoding-test
  "test to Encode a given latitude longitude into geohash"
  (is (equal (encode 35.7101389 139.8108333 8) "xn77jkz4"))
  (is (equal (encode 4.616335 -74.071275 6) "d2g662"))
  (is (equal (encode 35.7101389 139.8108333 3) "xn7"))
  (is (equal (encode 35.7101389 139.8108333 10) "xn77jkz4ss"))
  (is (equal (length (encode 35.7101389 139.8108333 3)) 3))
  (is (equal (length (encode 35.7101389 139.8108333 8)) 8))
  (is (equal (length (encode 35.7101389 139.8108333 10)) 10)))


(test decoding-test
  "test to Decode a Geohash into a latitude longitude"
      )

(defun run-tests ()
  (5am:run! 'geohash))

(run-tests)
