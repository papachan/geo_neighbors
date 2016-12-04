;;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-
(defpackage :geohash
  (:use :cl))

(in-package :geohash)

(defvar *base32_vars* "0123456789bcdefghjkmnpqrstuvwxyz")

(defun base32_pos (l)
  (string (aref *base32_vars* l)))

(defun toggling (length)
  (let ((even/odd 0))
    (loop repeat length do
         (if (eql even/odd 0)
             (setf result 0)
             (setf result 1))
         (format t " ~d~%" result)
         (setf even/odd (- 1 even/odd)))))

(defun enc (lat lon &optional (precision 12))
  (let ((even 0)
        (result nil)
        (bound_lon (cons -180 180))
        (bound_lat (cons -90 90)))
    (flet
        ((midcoord (a b) (float (/ (+ a b) 2))))
        (loop repeat precision
           for code = 0 do
             (loop for bit in '(16 8 4 2 1) do
                  (if (evenp even)
                      (progn
                        (setf mid (midcoord (car bound_lon) (cdr bound_lon)))
                        (if (> lon mid)
                            (setf bound_lon (cons mid (cdr bound_lon))
                                  code (+ code bit))
                            (setf bound_lon (cons (car bound_lon) mid))))
                      (progn
                        (setf mid (midcoord (car bound_lat) (cdr bound_lat)))
                        (if (> lat mid)
                            (setf bound_lat (cons mid (cdr bound_lat))
                                  code (+ code bit))
                            (setf bound_lat (cons (car bound_lat) mid))))))
             (push (base32_pos code) result)
             (setf even (+ 1 even))))
     (format t "~{~a~^ ~}" (nreverse result))))

(defun find_geocoordenates (lat lon)
  (let ((even 0)
        (bound_lon (cons -180 180))
        (bound_lat (cons -90 90)))
    (flet
        ((midcoord (a b) (float (/ (+ a b) 2))))
        (loop repeat 20 do
             (if (evenp even)
                 (progn
                   (setf mid (midcoord (car bound_lon) (cdr bound_lon)))
                   (if (> lon mid)
                       (setf bound_lon (cons mid (cdr bound_lon)))
                       (setf bound_lon (cons (car bound_lon) mid))))
                 (progn
                   (setf mid (midcoord (car bound_lat) (cdr bound_lat)))
                   (if (> lat mid)
                       (setf bound_lat (cons mid (cdr bound_lat)))
                       (setf bound_lat (cons (car bound_lat) mid)))))
             (print mid)
             (setf even (+ 1 even))))))

