;;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-
(defpackage :utils
  (:use :cl)
  (:export :convert_scale))

(in-package :utils)

(defun convert_scale (val &key (minor 3) (maximum 21))
  (let* ((m (min maximum val))
        (res (- m 10)))
    (max minor res)))

