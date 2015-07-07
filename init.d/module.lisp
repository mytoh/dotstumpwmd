
(require :alexandria)
(require :serapeum)

(add-to-load-path "~/huone/git/github.com/Jehops/swm-freebsd-volume-modeline")
(add-to-load-path "~/huone/git/github.com/Jehops/swm-freebsd-battery-modeline")
(add-to-load-path "~/huone/git/github.com/Jehops/swm-freebsd-cpu-modeline")
(add-to-load-path "~/huone/git/github.com/Jehops/swm-freebsd-mem-modeline")
(add-to-load-path "~/huone/git/github.com/Jehops/swm-freebsd-net-modeline")
(add-to-load-path "~/huone/git/github.com/Jehops/swm-freebsd-zfs-modeline")
(add-to-load-path "~/huone/git/github.com/Jehops/swm-hostname-modeline")
(add-to-load-path "~/huone/git/github.com/Jehops/swm-maildir-modeline")

(load-module "swm-freebsd-volume-modeline")
(load-module "swm-freebsd-cpu-modeline")
(load-module "swm-freebsd-mem-modeline")
(load-module "swm-freebsd-net-modeline")
(load-module "swm-hostname-modeline")

(defun my-find-in-env (path env)
  (let ((paths (split-string (getenv env) ":")))
    (find-if
     (serapeum:op (equal path _))
     paths)))

(defun my-add-to-path-env (path)
  (let ((env "PATH"))
    (unless (my-find-in-env path env)
      (setf (getenv env)
            (concatenate 'string (getenv env) ":"
                         path  )))))

(defun my-home (path)
  (concatenate 'string
               (getenv "HOME") "/"
               path))

(my-add-to-path-env (my-home "huone/git/github.com/Jehops/swm-freebsd-volume-modeline"))
(my-add-to-path-env (my-home "huone/git/github.com/Jehops/swm-freebsd-net-modeline"))
(my-add-to-path-env (my-home "huone/git/github.com/Jehops/swm-freebsd-cpu-modeline"))
(my-add-to-path-env (my-home "huone/git/github.com/Jehops/swm-freebsd-mem-modeline"))



(load-module "notifications")
