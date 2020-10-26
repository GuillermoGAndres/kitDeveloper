
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
;My first personalizacion
;(add-to-list 'load-path (expand-file-name "c:/Users/memoc/Documents/extensionesEmacs/color-theme-directory"))
;(require 'color-theme)
;(color-theme-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-ispell-fuzzy-limit 2)
 '(ac-ispell-requires 3)
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-safe-themes
   (quote
    ("2f9152fe4b4cdb216a077bdf1b02d8eec788b989c6ddc2641e632b9f4751b22a" default)))
 '(package-selected-packages
   (quote
    (yasnippet-snippets flycheck impatient-mode web-mode helm neotree ac-html emmet-mode nlinum-hl nlinum-relative ace-window ac-ispell auto-complete 2048-game chess)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;This a comentary, Here add MELP
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; I tried install aspell
;;(add-to-list 'exec-path "c:/Program Files (x86)/Aspell/bin")
(add-to-list 'exec-path "c:/msys64/mingw64/bin")
(setq ispell-program-name "aspell")

;;Configure the ac-ispell
;; Completion words longer than 4 characters
(add-hook 'some-mode-hook 'ac-ispell-ac-setup)
(setq ispell-complete-word-dict "c:/msys64/mingw64/lib/aspell-0.60/english.alias")


(eval-after-load "auto-complete"
  '(progn
     (ac-ispell-setup)))

(add-hook 'git-commit-mode-hook 'ac-ispell-ac-setup)
(add-hook 'mail-mode-hook 'ac-ispell-ac-setup)

(put 'upcase-region 'disabled nil)
;;;;;;
;(setq-default tab-width 10)
;;Modifica los espacion 4
(defun my-c++-mode-hook ()
  (setq c-basic-offset 4)
  (c-set-offset 'substatement-open 0))
(add-hook 'c++-mode-hook 'my-c++-mode-hook)
;;;;;;;;;
;;;Linea de numeros
;(defun my-c-mode-common-hook ()
 ; (line-number-mode 1))
;(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;(global-display-line-numbers-mode 1)
;;;;;;;;;;;;;;;

;; always show line numbers
;(global-linum-mode 1)

;; insert a space if running in text mode
;(if window-system
;    (progn)
;  (setq linum-format "%d ")
;  )

;;;ICE-WINDOWS
(global-set-key (kbd "C-x <up>") 'ace-window)

;;nlinum
;(require 'nlinum-hl)

;;;;;;;;;;;;;
;hightlight c/c++/java
;(semantic-mode 1)
;(require 'semantic/bovine/c nil 'noerror)
;(load-file "~/.emacs.d/myconfig/site-lisp/highlight.el") ;;OR in ELPA
;;(add-to-list 'load-path (expand-file-name "c:/Users/memoc/Documents/extensionesEmacs/"))
;;(require 'highlight)
;(load-file "~/.emacs.d/myconfig/site-lisp/region-list-edit.el")
;(add-to-list 'load-path (expand-file-name "c:/Users/memoc/Documents/extensionesEmacs/"))
;(require 'region-list-edit)
;(load-file "~/.emacs.d/myconfig/site-lisp/zjl-hl.el")
;(add-to-list 'load-path (expand-file-name "c:/Users/memoc/Documents/extensionesEmacs/"))
;(require 'zjl-hl)
;(zjl-hl-enable-global 'c-mode)
;(zjl-hl-enable-global 'c++-mode)
;(zjl-hl-enable-global 'java-mode)


(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/badger-theme")
;(load-theme 'badger t)
(menu-bar-mode -1)
(tool-bar-mode -1) 
;(setq inhibit-startup-message t)

;----------------------------Mi configuracion--------------------------------------------------  
;Auto complete
(ac-config-default)
(global-auto-complete-mode t)
;Aumentar tamaño de letra
(set-face-attribute 'default nil :height 120)
;Agregar numeros de lineas
;@reference: https://emacs.stackexchange.com/questions/278/how-do-i-display-line-numbers-in-emacs-not-in-the-mode-line
(add-hook 'prog-mode-hook 'linum-mode)
;@see: https://www.emacswiki.org/emacs/ShowParenMode
(show-paren-mode 1)

;------auto-complete tags popups of html in  html y web mode-------
(defun setup-ac-for-html ()
  ;; Require ac-haml since we are setup haml auto completion
  (require 'ac-html)
  ;; Require default data provider if you want to use
  (require 'ac-html-default-data-provider)
  ;; Enable data providers,
  ;; currently only default data provider available
  (ac-html-enable-data-provider 'ac-html-default-data-provider)
  ;; Let ac-haml do some setup
  (ac-html-setup)
  ;; Set your ac-source
  (setq ac-sources '(ac-source-html-tag
                     ac-source-html-attr
                     ac-source-html-attrv))
  ;; Enable auto complete mode
  (auto-complete-mode))


(add-hook 'html-mode-hook 'setup-ac-for-html)

;Better answer
(fset 'yes-or-no-p 'y-or-n-p)

(electric-pair-mode) ; enable autopair in all buffers

;Enable emmet automatly sgml(Lenguajes de etiqueta)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.

;Instaled MELPA neotree
(global-set-key [f8] 'neotree-toggle)
;Installed Melp helm
(global-set-key (kbd "M-x") 'helm-M-x) ;Enable automatically

; web mode
;(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;impatient-mode MELPA
;Enable the web server provided by simple-httpd:
;M-x httpd-start
;Publish buffers by enabling the minor mode impatient-mode.
;M-x impatient-mode
;And then point your browser to http://localhost:8080/imp/, select a buffer, and watch your changes appear as you type!
; http://localhost:8080/imp/

; Flycheck MELPA
; Para habilitarlo hazmo manual flycheck-mode

;yasnippe Melpa
(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
;(yas-global-mode 1)

(yas-reload-all)
(add-hook 'c++-mode-hook #'yas-minor-mode)
;eg: (add-hook 'c++-mode-hook 'my-c++-mode-hook)
