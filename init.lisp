;; -*- mode: common-lisp -*-
;; vim:filetype=lisp

;; settings taken from [[http://aperturefever.wordpress.com/2010/05/10/updating-stumpwm-conf/]]

(in-package #:stumpwm)


(defparameter terminal "mlc")

(defparameter *my-configs*
  '("module"
    "keymap"
    "hook"
    "command"
    "modeline"
    "group"
    "option"
    "program"))

(defparameter *my-rc-dir*
  (make-pathname :directory (append (pathname-directory (user-homedir-pathname))
                                    (list ".stumpwm.d"))))

(defun my-setup-load-configs ()
  (loop for file in *my-configs*
        do (load (merge-pathnames (make-pathname :name file :type "lisp"
                                                 :directory '(:relative "init.d" )) *my-rc-dir*))))

(defun my-init ()
  (when *initializing*
    (my-setup-load-configs)
    (message "*** intialize finished ***")))


(my-init)

(setf *debug-level* 10)
