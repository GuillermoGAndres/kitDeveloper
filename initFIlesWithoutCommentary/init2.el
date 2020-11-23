(setq user-full-name "Guillermo Andres")
(setq user-mail-address "memocampeon35@gmail.com")

;;;---------------------
;;;;; install the melpa repository
;;
(require 'package)
(setq package-archives (append package-archives
			       '(("melpa" . "http://melpa.org/packages/"))))
(package-initialize)

;; Bootstrap 'usepackage
(unless (package-installed-p 'use-package)
(package-refresh-contents)
(package-install 'use-package))

;; Enable use-package

(eval-when-compile
  (require 'use-package))
(require 'bind-key)


;; Set the path variable
(use-package exec-path-from-shell
  :ensure t
  :config (exec-path-from-shell-initialize))

;-------------------------------

;;disable startup screen
(setq inhibit-startup-screen t)

;Ocultar tool bar 
(tool-bar-mode -1)
(menu-bar-mode -1)
;Destacar la línea actual
;(global-hl-line-mode +1)
(if window-system
    (menu-bar-mode 1)
)


;; Wrap lines at 80 characters
(setq-default fill-column 80)

;; nice scrolling
  (setq scroll-margin 0
	scroll-conservatively 100000
	scroll-preserve-screen-position 1)



 ;; replace buffer-menu with ibuffer
  (use-package ibuffer
  :ensure t
  :config
  (global-set-key (kbd "C-x C-b") #'ibuffer))



;Commet y descommet
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)

; Ido mode (Better autocompletion in the mini buffer)
(ido-mode)
;Nyan mode (Gatito)
(nyan-mode)
;Helm mode
(global-set-key (kbd "M-x") 'helm-M-x)
;Inicializ Emacs server para sea mas rapido abrir archivos desde la terminal
;emacsclient file.java // By example
(server-start)

;Wrap lines o no 
;M-x toggle-truncate-lines
;if your lines wrap hard at the right-hand edge of the window,
;M-x visual-line-mode

;Aumentar tamaño de letra
(set-face-attribute 'default nil :height 130)
;Agregar numeros de lineas
;@reference: https://emacs.stackexchange.com/questions/278/how-do-i-display-line-numbers-in-emacs-not-in-the-mode-line
(add-hook 'prog-mode-hook 'linum-mode)
;@see: https://www.emacswiki.org/emacs/ShowParenMode
;Matches parentesis
(show-paren-mode 1)

;Better answer
(fset 'yes-or-no-p 'y-or-n-p)

(electric-pair-mode) ; enable autopair in all buffers

;; disable {} auto pairing in electric-pair-mode for web-mode
;https://www.topbug.net/blog/2016/09/29/emacs-disable-certain-pairs-for-electric-pair-mode/
(add-hook
 'web-mode-hook
 (lambda ()
   (setq-local electric-pair-inhibit-predicate
               `(lambda (c)
                  (if (char-equal c ?{) t (,electric-pair-inhibit-predicate c))))))

;permanently enable syntax checking with Flycheck
;(add-hook 'after-init-hook #'global-flycheck-mode)

;yasnippet
(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)


;Enable emmet automatly sgml(Lenguajes de etiqueta)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
(add-hook 'web-mode  'emmet-mode) ;; enable Emmet's web mode abbreviation.


;Instaldo desde MELPA doom-emacs
(load-theme 'doom-city-lights t)
;(set-face-foreground 'linum "#E8D92D")
;#ffcc00 amarillo
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(linum ((t (:inherit (shadow default) :background "#1D252C" :foreground "#B5B54A")))))

;Cambiar el color de la franja de los numeros
(set-face-attribute 'fringe nil :background "#1D252C")
;(setq-default left-fringe-width 11)

;;Modifica los espacion 4
(defun my-c++-mode-hook ()
  (setq c-basic-offset 4)
  (c-set-offset 'substatement-open 0))
(add-hook 'c++-mode-hook 'my-c++-mode-hook)
(add-hook 'c-mode-hook 'my-c++-mode-hook)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
;Agrega los archivos.html web mode
(require 'web-mode) 
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))

;Agregar emmet in web mode
(add-hook 'web-mode-hook  'emmet-mode)

;Resaltar el color de los numeros
(add-hook 'prog-mode-hook 'highlight-numbers-mode)


;----------------Company-web

;; you may key bind, for example for web-mode:
;; (define-key web-mode-map (kbd "C-'") 'company-web-html)
;; ;Only use company-mode with company-web-html in web-mode

(defun my-web-mode-hook ()
  "Hook for `web-mode'."
    (set (make-local-variable 'company-backends)
         '(company-css company-web-html company-yasnippet company-files)))

(add-hook 'web-mode-hook 'my-web-mode-hook)

;; Enable JavaScript completion between <script>...</script> etc.
(advice-add 'company-tern :before
            #'(lambda (&rest _)
                (if (equal major-mode 'web-mode)
                    (let ((web-mode-cur-language
                          (web-mode-language-at-pos)))
                      (if (or (string= web-mode-cur-language "javascript")
                              (string= web-mode-cur-language "jsx"))
                          (unless tern-mode (tern-mode))
                        (if tern-mode (tern-mode -1)))))))


;----------

;Resaldor de \t \n %s java, c/c++

(defface my-backslash-escape-backslash-face
  '((t :inherit font-lock-regexp-grouping-backslash))
  "Face for the back-slash component of a back-slash escape."
  :group 'font-lock-faces)

(defface my-backslash-escape-char-face
  '((t :inherit font-lock-regexp-grouping-construct))
  "Face for the charcter component of a back-slash escape."
  :group 'font-lock-faces)

(defface my-format-code-format-face
  '((t :inherit font-lock-regexp-grouping-backslash))
  "Face for the % component of a printf format code."
  :group 'font-lock-faces)

(defface my-format-code-directive-face
  '((t :inherit font-lock-regexp-grouping-construct))
  "Face for the directive component of a printf format code."
  :group 'font-lock-faces)


(font-lock-add-keywords 'c-mode
   '(("\\(\\\\\\)." 1 'my-backslash-escape-backslash-face prepend)
     ("\\\\\\(.\\)" 1 'my-backslash-escape-char-face      prepend)
     ("\\(%\\)."    1 'my-format-code-format-face         prepend)
     ("%\\(.\\)"    1 'my-format-code-directive-face      prepend)))

(font-lock-add-keywords 'java-mode
   '(("\\(\\\\\\)." 1 'my-backslash-escape-backslash-face prepend)
     ("\\\\\\(.\\)" 1 'my-backslash-escape-char-face      prepend)
     ("\\(%\\)."    1 'my-format-code-format-face         prepend)
     ("%\\(.\\)"    1 'my-format-code-directive-face      prepend)))

(font-lock-add-keywords 'c++mode
   '(("\\(\\\\\\)." 1 'my-backslash-escape-backslash-face prepend)
     ("\\\\\\(.\\)" 1 'my-backslash-escape-char-face      prepend)
     ("\\(%\\)."    1 'my-format-code-format-face         prepend)
     ("%\\(.\\)"    1 'my-format-code-directive-face      prepend)))

;------------
;jump function M.
(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)
;M \

;Refresf buffer
(global-set-key [f5] 'revert-buffer)




;------Company 
(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0.2)
  (setq company-show-numbers t)
  (setq company-tooltip-limit 10)
  (setq company-minimum-prefix-length 2)
  (setq company-tooltip-align-annotations t)
  ;; invert the navigation direction if the the completion popup-isearch-match
  ;; is displayed on top (happens near the bottom of windows)
  (setq company-tooltip-flip-when-above t)
  (global-company-mode))

;; manual autocomplete
;(global-set-key (kbd "M-RET") 'company-complete)
(global-set-key (kbd "<C-return>") 'company-complete)

;------


(use-package ivy
:ensure t
:config 
 (setq ivy-use-virtual-buffers t)
 (setq ivy-count-format "(%d/%d) "))

(use-package swiper
:ensure t
:config 
(global-set-key (kbd "C-s") 'swiper))


(use-package counsel
:ensure t
:config 
 (global-set-key (kbd "M-x") 'counsel-M-x)
 (global-set-key (kbd "C-x C-f") 'counsel-find-file)
 (global-set-key (kbd "<f1> f") 'counsel-describe-function)
 (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
 (global-set-key (kbd "<f1> l") 'counsel-find-library)
 (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
 (global-set-key (kbd "<f2> u") 'counsel-unicode-char))




(use-package neotree
:ensure t
:config
(setq neo-theme 'icons)
(global-set-key [f8] 'neotree-toggle))





(use-package org
:ensure t
:config
(setq org-hide-emphasis-markers t))


(font-lock-add-keywords 'org-mode
                        '(("^ +\\([-*]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))


(add-hook 'org-mode-hook 'visual-line-mode)

; pantalla de inicio bonito

(use-package dashboard
:ensure t
:config
(dashboard-setup-startup-hook)

;; Set the title
(setq dashboard-banner-logo-title "Bienvenido al mejor Editor del Mundo -- Emacs --")


(setq dashboard-startup-banner 'logo)
;; Value can be
;; 'official which displays the official emacs logo
;; 'logo which displays an alternative emacs logo
;; 1, 2 or 3 which displays one of the text banners
;; "path/to/your/image.png" which displays whatever image you would prefer

;; Content is not centered by default. To center, set
(setq dashboard-center-content nil)

;; To disable shortcut "jump" indicators for each section, set
(setq dashboard-show-shortcuts nil)

;;To customize which widgets are displayed, you can use the following snippet

(setq dashboard-items '((recents  . 5)
                        (projects . 5)
                        (agenda . 5)))

(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)

(dashboard-modify-heading-icons '((recents . "file-text")
                                  (bookmarks . "book")))

(setq dashboard-set-init-info t)


(add-to-list 'dashboard-items '(agenda) t)

(setq show-week-agenda-p t))

;;;;;;;;;;;;;

(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1))


;; iniciamos el paquete which-key
(use-package which-key
:defer 10
:ensure t
:config
(which-key-setup-minibuffer)
(which-key-mode 1))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(nil nil t)
 '(package-selected-packages
   '(all-the-icons counsel swiper exec-path-from-shell use-package yasnippet-snippets web-mode nyan-mode memoize magit lsp-java langtool kaolin-themes ivy impatient-mode highlight-numbers highlight-escape-sequences helm google-translate flycheck emmet-mode eglot dumb-jump doom-themes define-word company-web company-c-headers ac-html-csswatcher ac-html ac-clang ac-capf ac-c-headers)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
