;;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-
(defpackage :utils
  (:use :cl)
  (:export :convert_scale))

(in-package :utils)

(defun convert_scale (val &key (minor 3) (maximum 14))
  (let* ((d (floor (/ maximum 2)))
         (res (- val d)))
    (max minor res)))

