
(defun my-setup-groups ()
  (message "setup groups")
  ;; rename the first group to main
  ;;(setf (group-name (first (screen (current-screen)))) "main")
  ;; create the other group
  ;; gnewbg, gnewbg-float
  (grename "main")

  (let ((main (current-group))
        (web (gnewbg "web"))
        (dev (gnewbg "dev"))
         (pc  (gnewbg "pc"))
;;        (pc  (gnewbg-float "pc"))
        (media (gnewbg "media"))
        (file (gnewbg "file")))

    (defparameter *main-group* main)
    (defparameter *web-group*  web)
    (defparameter *dev-group*  dev)
    (defparameter *pc-group*  pc)
    (defparameter *media-group* media)
    (defparameter *file-group* file)

    ;; window placement rules
    (clear-window-placement-rules) ; clear rules

    ;;; [[https://github.com/stumpwm/stumpwm/blob/master/sample-stumpwmrc.lisp][github]]
    ;; Last rule to match takes precedence!
    ;; TIP: if the argument to :title or :role begins with an ellipsis, a substring
    ;; match is performed.
    ;; TIP: if the :create flag is set then a missing group will be created and
    ;; restored from *data-dir*/create file.
    ;; TIP: if the :restore flag is set then group dump is restored even for an
    ;; existing group using *data-dir*/restore file.
    (define-frame-preference "main"
        (0 t t :class "mlterm"))

    (define-frame-preference "web"
        ;; (fnumber raise lock), lock AND raise == jumpto
        (0 t t :class "Opera")
      (0 t t :class "Firefox")
      (0 t t :class "Conkeror")
      (0 t t :class "Midori")
      (0 t t :class "Xombrero")
      (0 t t :class "V2C"))

    (define-frame-preference "dev"
        ;; (fnumber raise lock), lock AND raise == jumpto
        (0 t t :class "Emacs"))

    (define-frame-preference "pc"
        (0 t t :class "MPlayer")
      (0 t t :class "mplayer2"))

    (define-frame-preference "media"
        (0 t t :class "Audacious")
      (0 t t :class "feh")
      (0 t t :class "jd-Main")
      (0 t t :Class "Vlc")
      (0 t t :class "Qmmp")
      (0 t t :class "Audacious")
      (0 t t :class "mpv")
      (0 t t :class "baka-mplayer")
      (0 t t :class "MComix")
      (0 t t :class "gogglesmm")

      (0 t t :class "Caja"))

    (define-frame-preference "file"
        (0 t t :class "Pcmanfm")
      (0 t t :class "Thunar")
      (0 t t :class "Doublecmd")
      (0 t t :class "Dolphin")
      (0 t t :class "Nemo")
      (0 t t :class "ROX-Filer")
      (0 t t :class "Rodent"))
    ))

(my-setup-groups)
