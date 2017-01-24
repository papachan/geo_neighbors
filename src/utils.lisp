;;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-
(defpackage :utils
  (:use :cl)
  (:export :convert_scale))

(in-package :utils)

(defun convert_scale (val &key (minor 3) (maximum 18))
  (let* ((m (min maximum val))
         (res (* (round (float (/ (- m minor) (- maximum minor)))) 6)))
    (max minor res)))

