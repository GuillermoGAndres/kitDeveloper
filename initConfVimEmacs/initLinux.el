(setq user-full-name "Guillermo Andres")
(setq user-mail-address "memocampeon35@gmail.com")

;;;---------------------
;;;;; install the melpa repository
;;
(require 'package)
(setq package-archives (append package-archives
			       '(("melpa" . "http://melpa.org/packages/"))))


(add-to-list 'package-archives
         '("elpa" . "https://elpa.typefo.com/packages/") t)


(package-initialize)

;; Bootstrap 'usepackage
(unless (package-installed-p 'use-package)
(package-refresh-contents)
(package-install 'use-package))

;; Enable use-package
;http://cachestocaches.com/2015/8/getting-started-use-package/
(eval-when-compile
  (require 'use-package))
(require 'bind-key)

;; Set the path variable
(use-package exec-path-from-shell
  :ensure t
  :config (exec-path-from-shell-initialize))

;---------------------------Paquetes de Melpa-------------------------------------------------- 

;----------------------------Mi configuracion--------------------------------------------------  
;Auto complete
;(ac-config-default)
;(global-auto-complete-mode t)

;----------------Company
;; (setq company-minimum-prefix-length 0)            ; WARNING, probably you will get perfomance issue if min len is 0!
;; (setq company-tooltip-limit 20)                      ; bigger popup window
;; (setq company-tooltip-align-annotations 't)          ; align annotations to the right tooltip border
;; (setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
;(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing
;; (global-set-key (kbd "C-c /") 'company-files)        ; Force complete file names on "C-c /" key

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

;Initialization company
;(add-hook 'after-init-hook 'global-company-mode)
;; manual autocomplete
;(global-set-key (kbd "M-RET") 'company-complete)
(global-set-key (kbd "<C-return>") 'company-complete)

;Company box, para toltip de ayuda.
;; With use-package:
;(use-package company-box
;  :hook (company-mode . company-box-mode))

;Commet y descommet
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)

; Ido mode (Better autocompletion in the mini buffer)
;(ido-mode)

;Helm mode
(global-set-key (kbd "M-x") 'helm-M-x)
;Inicializ Emacs server para sea mas rapido abrir archivos desde la terminal
;emacsclient file.java // By example
;(server-start)

;Wrap lines o no 
;M-x toggle-truncate-lines

;if your lines wrap hard at the right-hand edge of the window,
;M-x visual-line-mode

;Control-Alt-n Encuentra su otro parentesis
;C-M-n forward-sexp
;C-M-b backward-sexp

;-------------------------------------
;Aumentar tamaño de letra, before config: 130
(set-face-attribute 'default nil :height 140)
;Agregar numeros de lineas
;@reference: https://emacs.stackexchange.com/questions/278/how-do-i-display-line-numbers-in-emacs-not-in-the-mode-line
(add-hook 'prog-mode-hook 'linum-mode)
;@see: https://www.emacswiki.org/emacs/ShowParenMode
;Matches parentesis
(show-paren-mode 1)

;Ese theme tambien me gusto
;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/badger-theme")
;(load-theme 'badger t)

(add-to-list 'custom-theme-load-path "/home/guillermo/.emacs.d/themes/darkburn-theme")
(load-theme 'darkburn t)

;Nyan mode (Gatito)
(nyan-mode)

;(add-to-list 'load-path "~/.emacs.d/plugins/emacs-neotree/")
;(require 'neotree)
;(global-set-key [f12] 'neotree-toggle)

(use-package neotree
:ensure t
:config
(setq neo-theme 'icons)
(global-set-key [f12] 'neotree-toggle))



;Ocultar tool bar 
(tool-bar-mode -1)
(menu-bar-mode -1) 
;Destacar la línea actual
;(global-hl-line-mode +1)
;Pava ver menu bar solo cuando es ejecutado windos-system (GUI)
;; (if window-system
;;     (menu-bar-mode 1)
;; )

;Don't show intro
(setq inhibit-startup-message t)

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




(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/challenger-deep-theme")
;(load-theme 'challenger-deep t)

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
;(load-theme 'doom-city-lights t)

;(set-face-foreground 'linum "#E8D92D")
;#ffcc00 amarillo
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(linum ((t (:inherit (shadow default) :background "#111111" :foreground "#F0DFAF")))))



;'(linum ((t (:inherit (shadow default) :background "#1D252C" :foreground "#B5B54A"))))) ;city-light
;Cambiar el color de la franja de los numeros
;(set-face-attribute 'fringe nil :background "#1D252C")
(set-face-attribute 'fringe nil :background "#171717")
;(set-face-attribute 'fringe nil :background "#111111")

;(setq-default left-fringe-width 11)

;;Modifica los espacion 4
(defun my-c++-mode-hook ()
  (setq c-basic-offset 4)
  (c-set-offset 'substatement-open 0))
(add-hook 'c++-mode-hook 'my-c++-mode-hook)
(add-hook 'c-mode-hook 'my-c++-mode-hook)
;(global-set-key (kbd "<C-x <up>") tab-bar-switch-to-next-tab)
;(global-set-key (kbd "<C-x <down>") tab-bar-switch-to-prev-tab)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)



;------------------------------Web mode-

;Agrega los archivos.html web mode
(require 'web-mode) 
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))

;Configuration
;; (defun my-web-mode-hook ()
;;   "Hooks for Web mode."
;;   (setq web-mode-markup-indent-offset 2)
;;   (setq web-mode-code-indent-offset 2)
;;   (setq web-mode-css-indent-offset 2)
;; )
;; (add-hook 'web-mode-hook  'my-web-mode-hook)    
;; (setq tab-width 2)


;Agregar emmet in web mode
(add-hook 'web-mode-hook  'emmet-mode)
;Highlight current HTML element
(setq web-mode-enable-current-element-highlight t)
; highlight the current column with 
;(setq web-mode-enable-current-column-highlight t)
;(setq web-mode-enable-auto-pairing t)
(define-key web-mode-map (kbd "C-n") 'web-mode-tag-match)
;(setq web-mode-markup-indent-offset 2)

;----------------Company-web

;; you may key bind, for example for web-mode:
;; (define-key web-mode-map (kbd "C-'") 'company-web-html)
;; ;Only use company-mode with company-web-html in web-mode

(defun my-web-mode-hook ()
  "Hook for `web-mode'."
    (set (make-local-variable 'company-backends)
         '(company-css company-web-html company-yasnippet company-files)))

(add-hook 'web-mode-hook 'my-web-mode-hook)

;; (eval-after-load "company"
;;   '(add-to-list 'company-backends 'company-bootstrap))


;; (add-hook 'after-init-hook 'global-company-mode)
;; (eval-after-load "company"
;;   '(add-to-list 'company-backends 'company-bootstrap))

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

;; manual autocomplete
;(define-key web-mode-map (kbd "M-RET") 'company-complete)

(define-key web-mode-map (kbd "C-c -") 'company-bootstrap)

;MUestro los numeros a color
(add-hook 'prog-mode-hook 'highlight-numbers-mode)
;(hes-mode)

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


;Refresf buffer
(global-set-key [f5] 'revert-buffer)
;Evoid confirmation
;(global-set-key [f5] (lambda () (interactive) (revert-buffer nil t)))

;Define word (Search a dictionary wordnik)
(global-set-key (kbd "C-c d") 'define-word-at-point)
(global-set-key (kbd "C-c D") 'define-word)

; Google translate
;(setq google-translate-default-source-language "auto")  ; Auto detect language.
(setq google-translate-default-source-language "en")  ; Auto detect language.
(setq google-translate-default-target-language "es")    ; Set your target language.
;Binding or shortcuts
(global-set-key (kbd "C-c t") 'google-translate-at-point)
(global-set-key (kbd "C-c T") 'google-translate-query-translate)

;Reverse translate
(global-set-key (kbd "C-c r") 'google-translate-at-point-reverse)
(global-set-key (kbd "C-c R") 'google-translate-query-translate-reverse)

; Corrector ortografico  ( spell checker )
(setq-default ispell-program-name "aspell")
	
(setq ispell-dictionary "english")

;M $ :Check and correct spelling of the word at point (ispell-word). If the region is active, do it for all words in the region instead.
;M-x ispell : Check and correct spelling of all words in the buffer. If the region is active, do it for all words in the region instead. 
;M-x flyspell-prog-mode : Enable Flyspell mode for comments and strings only. 
;M-x flyspell-mode : Enable Flyspell mode, which highlights all misspelled words. 

;Flyspell comes with a mode to check comments and strings in programming modes. Just type M-x flyspell-prog-mode or add it to your mode hooks
  ;; (add-hook 'c++-mode-hook
  ;;         (lambda ()
  ;;           (flyspell-prog-mode)
  ;;           ; ...
  ;;           ))

(add-hook 'LaTeX-mode-hook 'flyspell-mode) ;start flyspell-mode
;(add-hook 'c++-mode-hook 'flyspell-prog-mode)

; Langtool (check gramatical)

(setq langtool-language-tool-jar "~/bin/LanguageTool-5.1/languagetool-commandline.jar")
(require 'langtool)

;; (global-set-key "\C-x4w" 'langtool-check)
;; (global-set-key "\C-x4W" 'langtool-check-done)
;; (global-set-key "\C-x4l" 'langtool-switch-default-language)
;; (global-set-key "\C-x44" 'langtool-show-message-at-point)
;; (global-set-key "\C-x4c" 'langtool-correct-buffer)
(setq langtool-default-language "en-US")


(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

(global-set-key (kbd "C-x C-b") 'ibuffer)



; Helm

(global-set-key (kbd "M-y") 'helm-show-kill-ring)
;(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x b") 'counsel-switch-buffer)
;(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
;(helm-mode 1)

(global-set-key (kbd "C-s") 'helm-occur)
(global-set-key [f11] 'helm-semantic-or-imenu)

(global-set-key (kbd "C-x g") 'goto-line)

;jump function M.]  dump-jump
(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)

(use-package rainbow-delimiters
:ensure t
:defer t
:config
(add-hook 'prog-mode-hook #'prog-delimiters-mode))

(add-hook 'c-mode-hook 'flycheck-mode)
(add-hook 'c++-mode-hook 'flycheck-mode)
; Con esto lo agrega para la lista de recomendacion de company
(add-to-list 'company-backends 'company-c-headers)

(global-set-key (kbd "C-c c") 'compile)

;(mode-icons-mode)
;(require 'lsp-java)
;(add-hook 'java-mode-hook #'lsp);
;Use impatient-mode
;M-x httpd-start
;M-x impatient-mode

;http://localhost:8080/imp/

;Previuw markdown
(defun markdown-html (buffer)
  (princ (with-current-buffer buffer
    (format "<!DOCTYPE html><html><title>Impatient Markdown</title><xmp theme=\"united\" style=\"display:none;\"> %s  </xmp><script src=\"http://strapdownjs.com/v/0.2/strapdown.js\"></script></html>" (buffer-substring-no-properties (point-min) (point-max))))
  (current-buffer)))

;Tell impatient mode to use it: M-x imp-set-user-filter RET markdown-html RET
;https://stackoverflow.com/questions/36183071/how-can-i-preview-markdown-in-emacs-in-real-time/36189456
;https://blog.bitsandbobs.net/blog/emacs-markdown-live-preview/

;; (defun my-markdown-preview ()
;;   "Preview markdown."
;;   (interactive)
;;   (httpd-start)
;;   (impatient-mode)
;;   (imp-set-user-filter "markdown-html")
;;   )

(add-hook 'markdown-mode-hook  'visual-line-mode)
(add-hook 'text-mode-hook  'visual-line-mode)
(add-hook 'org-mode  'visual-line-mode)
(add-hook 'web-mode-hook  'visual-line-mode)



(require 'multiple-cursors)

(global-set-key (kbd "C-c C-m") 'mc/edit-lines)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(global-set-key (kbd "C-c C-a") 'mc/skip-to-previous-like-this)


(require 'flymd)

 (defun my-flymd-browser-function (url)
   (let ((browse-url-browser-function 'browse-url-firefox))
     (browse-url url)))
 (setq flymd-browser-open-function 'my-flymd-browser-function)


;; (use-package doom-modeline
;;   :ensure t
;;   :init (doom-modeline-mode 1))


;; (use-package doom-modeline
;;   :ensure t
;;   :hook (after-init . doom-modeline-mode))



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(company-bootstrap doom-modeline multiple-cursors flymd company-box company-quickhelp mode-icons yasnippet-snippets which-key web-mode use-package rainbow-delimiters projectile nyan-mode neotree magit lsp-java langtool kaolin-themes impatient-mode highlight-numbers highlight-escape-sequences helm google-translate flycheck exec-path-from-shell emmet-mode eglot dumb-jump doom-themes define-word dashboard counsel company-web company-c-headers all-the-icons ac-html-csswatcher ac-html ac-clang ac-capf ac-c-headers)))

 



