;;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-
(defpackage :utils
  (:use :cl)
  (:export :convert_scale))

(in-package :utils)

(defun convert_scale (n)
  (* (round (float(/ n 12))) 12))


