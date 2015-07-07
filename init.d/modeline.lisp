;;(load-module "stumptray")

(defun my-setup-colours ()
  (setf *colors* (list "grey"          ; 0 black
                       "palevioletred" ; 1 red
                       "lightblue"     ; 2 green
                       "bisque"        ; 3 yellow
                       "lightskyblue"  ; 4 blue
                       "magenta"     ; 5 magenta
                       "aquamarine"    ; 6 cyan
                       "honeydew"      ; 7 white
                       "thistle"       ; 8 user
                       "lightskyblue" ;  9 user
                       ))

  (update-color-map (current-screen)))

(defun my-setup-modeline-options ()
  (setf
   *mode-line-background-color*     "grey20"
   *mode-line-foreground-color*      "white"
   *mode-line-border-color*             "pink"
   *mode-line-position*                    :top
   *mode-line-border-width*          0
   *mode-line-pad-x*                     1
   *mode-line-pad-y*                     1
   *mode-line-timeout*                  3))


;; [[https://github.com/joelagnel/stumpwm-goodies/tree/master/mode-line]]
(defun show-ip-address ()
  (let ((ip (run-shell-command "ifconfig em0 | grep 'inet ' | cut -d ' ' -f2 | head -n 1" t)))
    (substitute #\Space #\Newline ip)))

(defun my-setup-modeline ()
  (if (not (head-mode-line (current-head)))
      (toggle-mode-line (current-screen) (current-head))))


(setf *screen-mode-line-format*  ;; ^n : normal bg and fg color
      (list "%g"
            " ^[^2*%w^] "
            ;; '(:eval (run-shell-command "~/.stumpwm.d/modeline.scm" t))
            ;;" ^5*:music ^n%m"
            ;;              " ^5*:cpu ^n%c %t"
            ;;              " ^5*:net ^n%l"

            "^>" ;; separator

            ;; host
            "^[^B^7*%h^] "

            ;; ip
            "^[^3*ip^] "
            '(:eval (show-ip-address))

            ;; cpu
            ;;            "^[^8*cpu^] %f^[^4*MHz^] "

            ;; mem
            "^[^8*mem^] %M^[^9*%%^] "

            ;; net
            ;; "^[^8*%I^] %U^[^9*KiB/s^] %D^[^9*KiB/s^]"

            ;; volume
            "^[^8*vol^] %v"

            "^(:fg \"#3c8b73\")%d"

            "  "
            ))

(my-setup-colours)
(my-setup-modeline-options)
(my-setup-modeline)
