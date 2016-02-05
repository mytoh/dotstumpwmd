
(defun my-setup-groups ()
  (message "setup groups")
  ;; rename the first group to main
  ;;(setf (group-name (first (screen (current-screen)))) "main")
  ;; create the other group
  ;; gnewbg, gnewbg-float
  (grename "main")

  (let ((main (current-group))
        (web (gnewbg "web"))
        (gnu (gnewbg "gnu"))
        (pc  (gnewbg "pc"))
        ;;(pc  (gnewbg-float "pc"))
        (media (gnewbg "media"))
        (pic (gnewbg "pic")))

    (defparameter *main-group* main)
    (defparameter *web-group*  web)
    (defparameter *gnu-group*  gnu)
    (defparameter *pc-group*  pc)
    (defparameter *media-group* media)
    (defparameter *pic-group* pic)

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
        (0 nil t :class "mlterm")
      (0 nil 'lock :class "URxvt"))

    (define-frame-preference "web"
        ;; (fnumber raise lock), lock AND raise == jumpto
        (0 nil t :class "Opera")
      (0 nil t :class "Firefox")
      (0 nil t :class "Conkeror")
      (0 nil t :class "Midori")
      (0 nil t :class "Xombrero")
      (0 nil t :class "V2C"))

    (define-frame-preference "gnu"
        ;; (fnumber raise lock), lock AND raise == jumpto
        (0 'raise 'lock :class "Emacs"))

    (define-frame-preference "pc"
        (0 nil t :class "MPlayer")
      (0 nil t :class "mplayer2"))

    (define-frame-preference "media"
        (0 nil t :class "Audacious")
      (0 nil t :class "jd-Main")
      (0 nil t :Class "Vlc")
      (0 nil t :class "Qmmp")
      (0 nil t :class "Audacious")
      (0 nil t :class "mpv")
      (0 nil t :class "avplay")
      (0 nil t :class "baka-mplayer")
      (0 nil t :class "gogglesmm")
      )

    (define-frame-preference "pic"
        (0 nil t :class "Pcmanfm")
      (0 nil t :class "Thunar")
      (0 nil t :class "Doublecmd")
      (0 nil t :class "Dolphin")
      (0 nil t :class "Nemo")
      (0 nil t :class "Caja")
      (0 nil t :class "ROX-Filer")
      (0 nil t :class "Rodent")

      (0 nil t :class "MComix")
      (0 nil t :class "feh"))
    ))

(my-setup-groups)
