
;;; keymap {{{
;;;
;;;  modifier keys are defined in
;;;  keytrans.lisp
;;;

;; applications
(defun my-keymap-shortcut (prefix)
  (defparameter *shortcut-map*
    (let ((map (make-sparse-keymap)))
      (defprogram-shortcut terminal :command "exec mlc" :key (kbd "t") :map map :props '(:class "mlterm"))
      (defprogram-shortcut browser  :command "exec conkeror" :key (kbd "w") :map map)
      (defprogram-shortcut filer    :command "exec rox" :key (kbd "f") :map map :props '(:class "ROX-Filer"))
      ;; (defprogram-shortcut dmenu    :command "exec dmenu_run -p '> ' -i -b -nb 'grey14' -nf 'orange' -sb 'grey10' -sf '#4d3e41' "
      ;;   :key (kbd "r") :map map)
      ;;; rofi -now -font “snap 10” -fg “#505050” -bg “#000000” -hlfg “#ffb964” -hlbg “#000000” -o 85
      (defprogram-shortcut dmenu    :command "exec rofi -dmenu -show run -p '> ' -fg '#505050' -bg '#000000' -hlfg '#ffb964' -hlbg '#000000'"
        :key (kbd "r") :map map)
      (defprogram-shortcut emacs :command "exec emacs" :key (kbd "e") :map map :props '(:class "Emacs"))
      (defprogram-shortcut v2c :command "exec v2c" :key (kbd "v") :map map)
      map))
  (bind prefix '*shortcut-map*))

(defmacro my-defkeys (name f)
  `(defmacro ,name (&rest keys)
     (let ((ks (mapcar #'(lambda (k) (cons ',f k)) keys)))
       `(progn ,@ks))))

;; github.com/Juev/stumpwm-config
(defmacro my-defkey-top (key cmd)
  `(define-key *top-map* (kbd ,key) ,cmd))
(my-defkeys my-defkeys-top my-defkey-top)

(defmacro my-defkey-root (key cmd)
  `(define-key *root-map* (kbd ,key) ,cmd))
(my-defkeys my-defkeys-root my-defkey-root)

(defmacro my-defkey-input (key cmd)
  `(define-key *input-map* (kbd ,key) ,cmd))
(my-defkeys my-defkeys-input my-defkey-input)

;; (defmacro defkey-group (key cmd)
;;   `(define-key *group-map* (kbd ,key) ,cmd))
;; (defmacro defkeys-group (&rest keys)
;;   (let ((ks (mapcar #'(lambda (k) (cons 'defkey-group k)) keys)))
;;     `(progn ,@ks)))

(my-defkeys-root
 ("C-."  "mymenu")
 ;; window operation
 ("C-f"   "fullscreen")
 ("C-o"   "fnext") ; default key "C-t o"
 ("C-r"   "restart-hard")
 ("C-s"   "swap-windows")
 ("~"     "rotate-windows")
 ("|"     "toggle-split"))

(my-defkeys-top
 ("s-r"  "exec dmenu_run -p '> ' -i -b -nb 'grey14' -nf 'orange' -sb 'grey10' -sf '#4d3e41' " )
 ("s-RET" "exec mlterm")
 ;; window operation
 ("s-TAB" "next")
 ("s-C" "kill")
 ;; group key map
 ("s-1" "gselect main")
 ("s-2" "gselect web")
 ("s-3" "gselect dev")
 ("s-4" "gselect pc")
 ("s-5" "gselect media")
 ("s-6" "gselect file")
 ("s-!" "gmove main")
 ("s-@" "gmove web")
 ("s-#" "gmove dev")
 ("s-$" "gmove pc")
 ("s-%" "gmove media")
 ("s-^" "gmove file")
 ("s-[" "gprev")
 ("s-]" "gnext")
 ("s-{" "gprev-with-window")
 ("s-}" "gnext-with-window")
 ("s-m" "unmaximize")
 )

;;input window keymap
(my-defkeys-input
 ("C-i" 'input-complete-forward)
 ("C-m" 'input-submit)
 ("C-h" 'input-delete-backward-char))

(my-keymap-shortcut "e")

;; group key map
;; (defkeys-group
;;   ("f" "gmove media"))

;;; }}}
