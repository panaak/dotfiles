(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "~/.emacs.d/site-lisp/")
(add-to-list 'load-path "~/.emacs.d/themes/")

;; Suppress warnings on startup
(setq ad-redefinition-action 'accept)

;;
;; package, well, its partially working now ;)
;;
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

;; pinned packages
;; use stable magit: @ https://github.com/magit/magit/wiki/Installation
;; (add-to-list 'package-pinned-packages '(magit . "melpa-stable"))

;; initialize all packages installed by package.el
(package-initialize)

;; Easy customize settings
(setq custom-file "~/.emacs.d/init-custom.el")
(load custom-file)

;;
;; OS specific stuff
;;
(cond
 ((string-equal system-type "windows-nt") ; Microsoft Windows
  (progn
    (message "Microsoft Windows")

    ;; fix for --group-directories-first
    (setq insert-directory-program "/sw/bin/gls")))

 ((string-equal system-type "darwin") ; Mac OS X
  (progn
    (message "Mac OS X"))
  (setq mouse-wheel-scroll-amount '(0.01))
  (set-default-font "DejaVu Sans Mono")
  ;; set default browser
  (setq browse-url-browser-function 'browse-url-default-macosx-browser))

 ((string-equal system-type "gnu/linux") ; linux
  (progn
    (message "Linux"))))


;; default dired omit mode
;; (setq-default dired-omit-files-p t)
;; (put 'dired-find-alternate-file 'disabled nil)

;; frame config
;; (setq default-frame-alist '((width . 225) (height . 60) (menu-bar-lines . 1) (fringe . 1) (vertical-scroll-bars . nil))
(setq default-frame-alist '((width . 162)
			    (height . 60)
			    (menu-bar-lines . 1)
			    (right-fringe . 0)
			    (left-fringe . 0)
			    (vertical-scroll-bars . nil)
			    (cursor-color . "darkgrey")))

;; no fucking scroll bar!!!
(set-scroll-bar-mode nil)

;; show parens
(show-paren-mode t)

(set-language-environment 'utf-8)
(set-keyboard-coding-system 'utf-8-mac) ; For old Carbon emacs on OS X only
(setq locale-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Yes/No prompt
(fset 'yes-or-no-p 'y-or-n-p)

;; scrolling
(setq scroll-margin 2
           scroll-conservatively 110
           ;; scroll-up-aggressively 0.1
           ;; scroll-up-aggressively 1.0
           ;; scroll-down-aggressively 0.1
           ;; scroll-down-aggressively 1.0
      )

;; scroll to top/bottom (former cua scroll-up) - not working
;;(setq scroll-error-top-bottom t)

;; bell fok off
(setq ring-bell-function 'ignore)

;; frame keys
(global-set-key (kbd "<f5>") 'make-frame-command)
(global-set-key (kbd "<f8>") 'delete-frame)
(global-set-key (kbd "C-x w") 'delete-frame)

;; cycle frames
(global-set-key (kbd "M-§") 'other-frame)
(global-set-key (kbd "s-§") 'other-frame)

;; set frame title
;; http://stackoverflow.com/a/12009623/3125928
(setq-default frame-title-format "%b (%f)")

;; tramp setup
;; (setq tramp-default-method "ssh")
(setq tramp-default-method "scp")

;;
;; external packages
;;
;; ;; gnus external abook
;; (require 'external-abook)
;; (setq external-abook-command "contacts -H -lSf '%%e\t\"%%n\"' '%s'")
;; ;; Bind `external-abook-try-expand' to a key binding of your choice.
;; (eval-after-load "message"
;;   '(progn
;;      (add-to-list 'message-mode-hook
;; 		  '(lambda ()
;; 		     (define-key message-mode-map (kbd "C-c TAB") 'external-abook-try-expand)))))


;; (add-to-list 'auto-mode-alist '("\\.log\\'" . auto-revert-mode))

;; ;; fonts and encoding
;; ;; use Monaco font in Mac OS X
;; (when (eq system-type 'darwin)
;;   ;; (set-default-font "Monaco"))
;;   (set-default-font "DejaVu Sans Mono"))


(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)


;; themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

;; (load-theme 'dichromacy t 0)
(load-theme 'railscasts t 0)
;; (load-theme 'solarized-dark t 0)
;; (load-theme 'sunburst t 0)
(load-theme 'wheat t 0)
(load-theme 'aalto-light t 0)
;;(enable-theme 'aalto-light)
;; (enable-theme 'wheat)
(enable-theme 'railscasts)
;; (enable-theme 'sunburst)

;;(color-theme-clarity)
;;(color-theme-deep-blue)
;;(color-theme-gray30)

;; toggle line wrapping
;;(setq-default truncate-lines 1)

;; (global-set-key (kbd "C-x C-b") 'buffer-menu)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "C-x r v") 'list-registers)

(setq calendar-latitude 50.097328)
(setq calendar-longitude 14.427175)
(setq calendar-location-name "Prague")

(xterm-mouse-mode 1)

;;
;; Packages setup
;;
;; unique filenames
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)

;; gnus desktop notify
(require 'gnus-desktop-notify)

;;(setq cua-enable-cua-keys nil)
;;(setq cua-highlight-region-shift-only t) ;; no transient mark mode
;;(setq cua-toggle-set-mark nil) ;; original set-mark behavior, i.e. no transient-mark-mode
;; (cua-mode t)

;; cua for scrolling
(require 'cua-base)
(cua-selection-mode +1)
(global-set-key (kbd "<prior>")   'scroll-down)
(global-set-key (kbd "<next>")   'scroll-up)
;; (global-set-key [remap scroll-up]   'cua-scroll-up)
;; (global-set-key [remap scroll-down] 'cua-scroll-down)

;;(cua-mode t)
(global-set-key (kbd "C-x SPC") 'cua-set-rectangle-mark)

;; cua global mark in terminal (iterm2 - C-S-SPC)
(global-set-key (kbd "M-[ 1 ; s") 'cua-toggle-global-mark)

;; web-mode.org
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
;; ;;(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
;; ;;(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))

(require 'sass-mode)
(add-to-list 'auto-mode-alist '("\\.sass\\'" . sass-mode))

;; haml-mode
(add-hook 'haml-mode-hook
	  '(lambda ()
	     (define-key haml-mode-map (kbd "M-;") 'haml-comment-block)
	     (define-key haml-mode-map (kbd "C-M-;") 'haml-uncomment-block)))


;; (windmove-default-keybindings 'meta)
(when (fboundp 'windmove-default-keybindings)
  ;;  (windmove-default-keybindings) 'meta)
  (windmove-default-keybindings))

;; ;; framemove
;; (require 'framemove)
;; (windmove-default-keybindings)
;; (setq framemove-hook-into-windmove t)

;; org-mode
;; Make windmove work in org-mode:
(add-hook 'org-shiftup-final-hook 'windmove-up)
(add-hook 'org-shiftleft-final-hook 'windmove-left)
(add-hook 'org-shiftdown-final-hook 'windmove-down)
(add-hook 'org-shiftright-final-hook 'windmove-right)

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-todo-keyword-faces
      '(
	("TODO"  . (:foreground "firebrick2" :weight bold))
	("WAITING"  . (:foreground "olivedrab" :weight bold))
	("LATER"  . (:foreground "sienna" :weight bold))
	("PROJECT"  . (:foreground "steelblue" :weight bold))
	("DONE"  . (:foreground "forestgreen" :weight bold))
	("MAYBE"  . (:foreground "dimgrey" :weight bold))
	("CANCELED"  . shadow)
	))

;; yaml-mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; winner
(winner-mode 1)

(require 'ace-jump-mode)
;; (define-key global-map (kbd "C-x a j") 'ace-jump-mode-pop-mark)
(define-key global-map (kbd "C-x C-a j") 'ace-jump-mode)
(define-key global-map (kbd "C-x C-a l") 'ace-jump-line-mode)
(define-key global-map (kbd "C-x C-a w") 'ace-jump-word-mode)

(require 'ace-jump-buffer)
(define-key global-map (kbd "C-c j") 'ace-jump-buffer)

(global-set-key (kbd "C-c \\") 'ace-window)

;; (require 'ace-isearch)
;; (global-ace-isearch-mode +1)

;;
;; ace-link
(require 'ace-link)
(ace-link-setup-default)

;;
;; iregister
(require 'iregister)
(global-set-key (kbd "M-n") 'iregister-jump-to-next-marker)
(global-set-key (kbd "M-p") 'iregister-jump-to-previous-marker)
(global-set-key (kbd "M-u") 'iregister-point-or-text-to-register)

(global-set-key (kbd "M-l") 'iregister-latest-text)

(global-set-key (kbd "M-w") 'iregister-point-or-text-to-register-kill-ring-save)
(global-set-key (kbd "C-w") 'iregister-copy-to-register-kill)
(global-set-key (kbd "M-y") 'iregister-latest-text)
;; (global-set-key (kbd "M-y") 'iregister-text)

;; ido-mode
(ido-mode t)
(ido-everywhere t)
(ido-vertical-mode t)
(setq ido-enable-flex-matching t)

;;(require 'smex) ;; Not needed if you use package.el
(smex-initialize) ;; Can be omitted. This might cause a (minimal) delay

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; ;; yasnippet - moving to package.el
;; (add-to-list 'load-path "~/.emacs.d/yasnippet")
(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/yasnippet/yasnippet-snippets" ;; personal snippets
        ))
(yas-global-mode 1)

;; projectile
(projectile-global-mode 1)
;; (add-hook 'ruby-mode-hook 'projectile-on)
(projectile-rails-global-mode)
;; (add-hook 'projectile-mode-hook 'projectile-rails-global-mode)

;; Default setup of smartparens
(require 'smartparens-config)
;; (setq sp-autoescape-string-quote nil)
(--each '(css-mode-hook
	  restclient-mode-hook
	  js-mode-hook
	  java-mode
	  ruby-mode
	  markdown-mode
	  groovy-mode)
  (add-hook it 'turn-on-smartparens-mode))

;; dired+ ?

;; pager
;;(require 'pager)
;;(global-set-key '[M-up]	   'pager-page-up)
;;(global-set-key '[M-down]  'pager-page-down)

;; ruby-tools
(require 'ruby-tools)
(global-set-key (kbd "C-x 9 '") 'ruby-tools-to-single-quote-string)
(global-set-key (kbd "C-M-'") 'ruby-tools-to-single-quote-string)
(global-set-key (kbd "C-x 9 \"") 'ruby-tools-to-double-quote-string)
(global-set-key (kbd "C-M-\"") 'ruby-tools-to-double-quote-string)
(global-set-key (kbd "C-x 9 ;") 'ruby-tools-clear-string)
(global-set-key (kbd "C-x 9 :") 'ruby-tools-to-symbol)
(global-set-key (kbd "C-x 9 #") 'ruby-tools-interpolate)

;; move-text
(require 'move-text)
(move-text-default-bindings)

;; goto-last-change
;; (global-set-key "\C-x\C-\\" 'goto-last-change)
(require 'goto-chg)
;; (global-set-key (kbd "C-x C-\\") 'goto-last-change)
;; (global-set-key (kbd "C-x C-|") 'goto-last-change-reverse)

(global-set-key (kbd "M-<XF86Back>") 'goto-last-change)
(global-set-key (kbd "M-<XF86Forward>") 'goto-last-change-reverse)

;; magit
(require 'magit)
;;(autoload 'magit-status "magit" nil t)
(global-set-key "\C-xg" 'magit-status)

(require 'fullframe)
(fullframe magit-status magit-mode-quit-window nil)

(smartscan-mode 1)

;; google translate binding
(global-set-key (kbd "C-x 9 t") 'google-translate-at-point)

;; direx viewer
;; (global-set-key (kbd "C-x C-j") 'direx:jump-to-directory)
(global-set-key (kbd "C-x C-j") 'dired-jump)

;; expand-region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "M-[ 1 ; =") 'er/expand-region)
;; (global-set-key (kbd "C-@") 'er/expand-region)

;; dired+ (shouldn't it load by itself ?)
(require 'dired+)

;; dired-k
(require 'dired-k)
(define-key dired-mode-map (kbd "K") 'dired-k)

;; smart-mode-line
(sml/setup)

;; e2wm
;; (3) M-x e2wm:start-management to start e2wm.
;; To stop e2wm, M-x e2wm:stop-management or [C-c ; Q].
(require 'e2wm)
(global-set-key (kbd "M-+") 'e2wm:start-management)

;; multiple-cursors
(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; guide-key
(require 'guide-key)
;; (setq guide-key/guide-key-sequence '("C-x r" "C-x 4"))
(setq guide-key/guide-key-sequence t)
;; (setq guide-key/guide-key-sequence-flag t)
(guide-key-mode 1) ; Enable guide-key-mode
;; tip
;; (require 'guide-key-tip)
;; (setq guide-key-tip/enabled t)
;; test
;; (defun guide-key/my-hook-function-for-org-mode ()
;;   (guide-key/add-local-guide-key-sequence "C-c")
;;   (guide-key/add-local-guide-key-sequence "C-c C-x")
;;   (guide-key/add-local-highlight-command-regexp "org-"))
;; (add-hook 'org-mode-hook 'guide-key/my-hook-function-for-org-mode)
;; (remove-hook 'org-mode-hook 'guide-key/my-hook-function-for-org-mode)

;; edit with emacs
;; http://www.emacswiki.org/emacs/Edit_with_Emacs
(when (and (daemonp) (locate-library "edit-server"))
  (require 'edit-server)
;;  (setq edit-server-new-frame nil)
  (edit-server-start))

;; ;; workgroups2
;; (require 'workgroups2)
;; ;; (global-set-key (kbd "<pause>") 'wg-reload-session)
;; ;; (global-set-key (kbd "C-S-<pause>") 'wg-save-session)
;; (global-set-key (kbd "<f6>") 'wg-switch-to-workgroup)
;; (global-set-key (kbd "<f7>") 'wg-reload-session)
;; (global-set-key (kbd "C-`") 'wg-switch-to-workgroup)
;; (global-set-key (kbd "C-§") 'wg-switch-to-workgroup)
;; (global-set-key (kbd "M-[ 1 ; `") 'wg-switch-to-workgroup)
;; (global-set-key (kbd "s-/") 'wg-switch-to-previous-workgroup)
;; (global-set-key (kbd "C-?") 'wg-switch-to-previous-workgroup)

;; (global-set-key (kbd "M-[ 1 ; 9 c") 'wg-switch-to-previous-workgroup)
;; (global-set-key (kbd "M-[ 1 ; 9 d") 'wg-switch-to-workgroup)
;; (global-set-key (kbd "S-s-<left>") 'wg-switch-to-workgroup-left)
;; (global-set-key (kbd "S-s-<right>") 'wg-switch-to-workgroup-right)
;; (global-set-key (kbd "C-<XF86Back>") 'wg-switch-to-workgroup-left)
;; (global-set-key (kbd "C-<XF86Forward>") 'wg-switch-to-workgroup-right)

(require 'workgroups)

;; (defun toggle-comment-on-line ()
;;   "comment or uncomment current line"
;;   (interactive)
;;   (comment-or-uncomment-region (line-beginning-position) (line-end-position)))
;; (global-set-key (kbd "<pause>") 'wg-reload-session)
;; (global-set-key (kbd "C-S-<pause>") 'wg-save-session)
(global-set-key (kbd "<f6>") 'wg-switch-to-workgroup)
;; (global-set-key (kbd "<f7>") 'wg-reload-session)
;; (global-set-key (kbd "<f7>") (function
;;          (lambda nil (interactive) (wg-load "~/.emacs.d/.workgroups"))))
(global-set-key (kbd "<f7>") 'load-workgroups)
(global-set-key (kbd "C-`") 'wg-switch-to-workgroup)
(global-set-key (kbd "C-§") 'wg-switch-to-workgroup)
(global-set-key (kbd "M-[ 1 ; `") 'wg-switch-to-workgroup)
(global-set-key (kbd "s-/") 'wg-switch-to-previous-workgroup)
(global-set-key (kbd "C-?") 'wg-switch-to-previous-workgroup)

(global-set-key (kbd "M-[ 1 ; 9 c") 'wg-switch-to-previous-workgroup)
(global-set-key (kbd "M-[ 1 ; 9 d") 'wg-switch-to-workgroup)
(global-set-key (kbd "S-s-<left>") 'wg-switch-left)
(global-set-key (kbd "S-s-<right>") 'wg-switch-right)
(global-set-key (kbd "C-<XF86Back>") 'wg-switch-left)
(global-set-key (kbd "C-<XF86Forward>") 'wg-switch-right)


;;
;; misc functions and it's keybindings
;;
(defun isearch-other-window ()
  (interactive)
  ;; thank you leo2007!
  (save-selected-window
    (other-window 1)
    (isearch-forward)))

(global-set-key (kbd "C-M-S") 'isearch-other-window)

;; comment / uncomment line
;; Original idea from
;; http://www.opensubscriber.com/message/emacs-devel@gnu.org/10971693.html
(defun comment-dwim-line (&optional arg)
  "Replacement for the comment-dwim command.
        If no region is selected and current line is not blank and we are not at the end of the line,
        then comment current line.
        Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))

(global-set-key (kbd "C-x /") 'comment-dwim-line)

;; duplicate-line
(defun duplicate-current-line (&optional n)
  "duplicate current line, make more than 1 copy given a numeric argument"
  (interactive "p")
  (save-excursion
    (let ((nb (or n 1))
	  (current-line (thing-at-point 'line)))
      ;; when on last line, insert a newline first
      (when (or (= 1 (forward-line 1)) (eq (point) (point-max)))
	(insert ""))
      ;; now insert as many time as requested
      (while (> n 0)
	(insert current-line)
	(decf n)))))

(global-set-key (kbd "C-c d") 'duplicate-current-line)

;; move line up/down
(defun move-line-up ()
  (interactive)
  (let ((col (current-column)))
  (transpose-lines 1)
  (forward-line -2)
  (move-to-column col)))


(defun move-line-down ()
  (interactive)
  (let ((col (current-column)))
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (move-to-column col)))

;; iTerm2 - i set the escape sequence of C-M-<up> and C-M-<down> to these
(global-set-key (kbd "M-[ 1 ; 9 a") 'move-line-up)
(global-set-key (kbd "M-[ 1 ; 9 b") 'move-line-down)
(global-set-key (kbd "C-M-<up>") 'move-line-up)
(global-set-key (kbd "C-M-<down>") 'move-line-down)

;; goto line with line numbers
(defun goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input"
  (interactive)
  (unwind-protect
      (progn
	(linum-mode 1)
	(goto-line (read-number "Goto line: ")))
    (linum-mode -1)))
(global-set-key [remap goto-line] 'goto-line-with-feedback)

(defun other-window-kill-buffer ()
  "Kill the buffer in the other window"
  (interactive)
  ;; Window selection is used because point goes to a different window
  ;; if more than 2 windows are present
  (let ((win-curr (selected-window))
        (win-other (next-window)))
    (select-window win-other)
    (kill-this-buffer)
    (select-window win-curr)))

(global-set-key (kbd "C-x K") 'other-window-kill-buffer)

;; load macros
(load "~/.emacs.d/macros.el")
(global-set-key (kbd "C-c /") 'comment-uncomment-paragraph)
(global-set-key (kbd "C-x C-k f") 'comment-flip-flop)

(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))

(defun comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)
        (next-line)))
(global-set-key (kbd "C-c k") 'comment-or-uncomment-region-or-line)

;; Remap C-a
(defun prelude-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

;; (global-set-key [remap move-beginning-of-line]
;;                 'prelude-move-beginning-of-line)
;; (global-set-key [remap beginning-of-visual-line]
;;                 'prelude-move-beginning-of-line)

;; (global-set-key "\C-a" 'beginning-of-visual-line)
(global-set-key "\C-a" 'prelude-move-beginning-of-line)

;; ;; sudo edit
;; (set-default 'tramp-default-proxies-alist (quote ((".*" "\\`root\\'" "/ssh:%h:"))))
(defun sudo-edit-current-file ()
  (interactive)
  (let ((my-file-name) ; fill this with the file to open
	(position))    ; if the file is already open save position
    (if (equal major-mode 'dired-mode) ; test if we are in dired-mode
	(progn
	  (setq my-file-name (dired-get-file-for-visit))
	  (find-alternate-file (prepare-tramp-sudo-string my-file-name)))
      (setq my-file-name (buffer-file-name); hopefully anything else is an already opened file
	    position (point))
      (find-alternate-file (prepare-tramp-sudo-string my-file-name))
      (goto-char position))))


(defun prepare-tramp-sudo-string (tempfile)
  (if (file-remote-p tempfile)
      (let ((vec (tramp-dissect-file-name tempfile)))

	(tramp-make-tramp-file-name
	 "sudo"
	 (tramp-file-name-user nil)
	 (tramp-file-name-host vec)
	 (tramp-file-name-localname vec)
	 (format "ssh:%s@%s|"
		 (tramp-file-name-user vec)
		 (tramp-file-name-host vec))))
    (concat "/sudo:root@localhost:" tempfile)))

;;(define-key dired-mode-map (kbd "C-x C-r") 'sudo-edit-current-file)
(global-set-key (kbd "C-x C-r") 'sudo-edit-current-file)

;; transpose wondows
(defun transpose-windows (arg)
   "Transpose the buffers shown in two windows."
   (interactive "p")
   (let ((selector (if (>= arg 0) 'next-window 'previous-window)))
     (while (/= arg 0)
       (let ((this-win (window-buffer))
             (next-win (window-buffer (funcall selector))))
         (set-window-buffer (selected-window) next-win)
         (set-window-buffer (funcall selector) this-win)
         (select-window (funcall selector)))
       (setq arg (if (plusp arg) (1- arg) (1+ arg))))))

(define-key ctl-x-4-map (kbd "t") 'transpose-windows)

;; create directory if it does not exist
;; http://iqbalansari.github.io/blog/2014/12/07/automatically-create-parent-directories-on-visiting-a-new-file-in-emacs/
(defun my-create-non-existent-directory ()
      (let ((parent-directory (file-name-directory buffer-file-name)))
        (when (and (not (file-exists-p parent-directory))
                   (y-or-n-p (format "Directory `%s' does not exist! Create it?" parent-directory)))
          (make-directory parent-directory t))))

(add-to-list 'find-file-not-found-functions #'my-create-non-existent-directory)

;; I want an easy command for opening new shells:
(defun new-shell (name)
  "Opens a new shell buffer with the given name in
asterisks (*name*) in the current directory and changes the
prompt to 'name>'."
  (interactive "sName: ")
  (pop-to-buffer (concat "*" name "*"))
  (unless (eq major-mode 'shell-mode)
    (shell (current-buffer))
    (sleep-for 0 200)
    (delete-region (point-min) (point-max))
    (comint-simple-send (get-buffer-process (current-buffer)))))

(global-set-key (kbd "C-c s") 'new-shell)

;; Dired
;; Changing the way M-< and M-> work in dired
;; Instead of taking me to the very beginning or very end, they now take me to the first or last file.
(defun dired-back-to-top ()
  (interactive)
  (beginning-of-buffer)
  (next-line 2))

(define-key dired-mode-map
  (vector 'remap 'beginning-of-buffer) 'dired-back-to-top)

(defun dired-jump-to-bottom ()
  (interactive)
  (end-of-buffer)
  (next-line -1))

(define-key dired-mode-map
  (vector 'remap 'end-of-buffer) 'dired-jump-to-bottom)

;; C-a is nicer in dired if it moves back to start of files
(defun dired-back-to-start-of-files ()
  (interactive)
  (backward-char (- (current-column) 2)))

(define-key dired-mode-map (kbd "C-a") 'dired-back-to-start-of-files)

;;
;; Hooks
;;
;; delete trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; dired-x
(add-hook 'dired-load-hook
          (lambda ()
                      (load "dired-x")
                      ;; Set global variables here.  For example:
                      ;; (setq dired-guess-shell-gnutar "gtar")
                      ))
;; dired
(add-hook 'dired-mode-hook
          (lambda ()
	    ;; Set buffer-local variables here.  For example:
	    (dired-omit-mode 1)

	    ;; dired-narrow
	    (define-key dired-mode-map (kbd "/") 'dired-narrow)
	    ))

;; delete region on insert
(pending-delete-mode t)

;; scroll other window down / iterm2: S-C-M-v
(global-set-key (kbd "M-[ 1 ; v") 'scroll-other-window-down)

;; srcolling
(setq scroll-preserve-screen-position t)

;; ;; copy/paste from terminal
;; (setq x-select-enable-clipboard t)
;; (setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

;; org mode mac protocol
(setq org-remember-templates
      '((template 1)
        (template 2)))

;;
;; misc keybingings
;;
(global-set-key (kbd "C-c C-q") 'delete-window)
(global-set-key (kbd "C-c q") 'bury-buffer)
(global-set-key (kbd "C-x k") 'kill-this-buffer)
(global-set-key (kbd "C-q") 'kill-this-buffer)
(global-set-key (kbd "M-s-ƒ") 'projectile-find-file-dwim)

(global-set-key (kbd "C-x 9 d") 'downcase-word)
(global-set-key (kbd "C-x 9 u") 'upcase-word)

;; unset some keys
(global-unset-key (kbd "s-l"))

;; buffer switching
(global-set-key (kbd "s-<right>") 'next-buffer)
(global-set-key (kbd "s-<left>") 'previous-buffer)

;; wdired
(global-set-key (kbd "C-x W") 'wdired-change-to-wdired-mode)


;;(toggle-debug-on-quit t)
;;(toggle-debug-on-error t)

;; dired-single init
(defun my-dired-init ()
  "Bunch of stuff to run for dired, either immediately or when it's
   loaded."
  ;; <add other stuff here>
  (define-key dired-mode-map [return] 'dired-single-buffer)
  (define-key dired-mode-map [mouse-1] 'dired-single-buffer-mouse)
  (define-key dired-mode-map "^"
        (function
         (lambda nil (interactive) (dired-single-buffer "..")))))

;; if dired's already loaded, then the keymap will be bound
(if (boundp 'dired-mode-map)
        ;; we're good to go; just add our bindings
        (my-dired-init)
  ;; it's not loaded yet, so add our bindings to the load-hook
  (add-hook 'dired-load-hook 'my-dired-init))

;; Workgroups loading
(defun load-workgroups ()
	"Loads workgroups file."
	(interactive)
	(wg-load "~/.emacs.d/.workgroups"))

(defun save-workgroups ()
	"Saves workgroups file."
	(interactive)
	(wg-save (wg-file)))
;; save workgroups on emacs exit
(add-hook 'kill-emacs-hook 'save-workgroups)


;;
;; Emacs server
;;
(require 'server)
(unless (server-running-p)
  (server-start))

;; define function to shutdown emacs server instance
(defun server-shutdown ()
  "Save buffers, Quit, and Shutdown (kill) server"
  (interactive)
  (save-some-buffers)
  (save-workgroups)
  (kill-emacs))

(setq wg-prefix-key (kbd "C-c w"))
;; ;; Change workgroups session file
;; (setq wg-session-file "~/.emacs.d/.emacs_workgroups")

(workgroups-mode 1)  ; put this one at the bottom of .emacs
(load-workgroups)
