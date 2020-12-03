(setq user-full-name "Guillermo Andres")
(setq user-mail-address "memocampeon35@gmail.com")

;; Create a variable to indicate where emacs's configuration is installed
(setq EMACS_DIR "~/.emacs.d/")

;; Avoid garbage collection at statup
;; (setq gc-cons-threshold most-positive-fixnum ; 2^61 bytes
;;       gc-cons-percentage 0.6)

;; (add-hook 'emacs-startup-hook
;;   (lambda ()
;;     (setq gc-cons-threshold 300000000 ; 300mb	
;;           gc-cons-percentage 0.1)))

;---------------------------Paquetes de Melpa--------------------------------
; install the melpa repository
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

;----------------------------Mi configuracion--------------------------------------------------  
;; Longer whitespace, otherwise syntax highlighting is limited to default column
(setq whitespace-line-column 1000) 

;; Enable soft-wrap
;; (global-visual-line-mode 1)

;; Maintain a list of recent files opened
(recentf-mode 1)            
(setq recentf-max-saved-items 50)


;; Move all the backup files to specific cache directory
;; This way you won't have annoying temporary files starting with ~(tilde) in each directory
;; Following setting will move temporary files to specific folders inside cache directory in EMACS_DIR

(setq user-cache-directory (concat EMACS_DIR "cache"))
(setq backup-directory-alist `(("." . ,(expand-file-name "backups" user-cache-directory)))
      url-history-file (expand-file-name "url/history" user-cache-directory)
      auto-save-list-file-prefix (expand-file-name "auto-save-list/.saves-" user-cache-directory)
      projectile-known-projects-file (expand-file-name "projectile-bookmarks.eld" user-cache-directory))


; Coding specific setting
;; Automatically add ending brackets and braces
;(electric-pair-mode 1)

;; Make sure tab-width is 4 and not 8
(setq-default tab-width 4)


;Look
;; (use-package doom-themes
;; :ensure t 
;; :init 
;; (load-theme 'doom-palenight t))

;; (use-package heaven-and-hell
;;   :ensure t
;;   :init
;;   (setq heaven-and-hell-theme-type 'dark)
;;   (setq heaven-and-hell-themes
;;         '((light . doom-acario-light)
;;           (dark . doom-palenight)))
;;   :hook (after-init . heaven-and-hell-init-hook)
;;   :bind (("C-c <f6>" . heaven-and-hell-load-default-theme)
;;          ("<f6>" . heaven-and-hell-toggle-theme)))


;; (use-package projectile 
;; :ensure t
;; :init (projectile-mode +1)
;; :config 
;; (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
;; )

(use-package helm
:ensure t
:init 
(helm-mode 1)
(progn (setq helm-buffers-fuzzy-matching t))
:bind
(("C-c h" . helm-command-prefix))
(("M-x" . helm-M-x))
(("C-c f" . helm-recentf))   ;; Add new key to recentf
(("M-y" . helm-show-kill-ring))
(("C-s" . helm-occur))
(([f10] . 'helm-semantic-or-imenu))
(("C-c g" . helm-grep-do-git-grep)))  ;; Search using grep in a git project

;Helm mode
;(global-set-key (kbd "M-x") 'helm-M-x)
; Helm
;(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x b") 'counsel-switch-buffer)
;(global-set-key (kbd "C-x C-f") 'helm-find-files)

(global-set-key (kbd "C-x C-f") 'counsel-find-file)

;(helm-mode 1)
;(global-set-key (kbd "M-y") 'helm-show-kill-ring)
;(global-set-key (kbd "C-s") 'helm-occur)
;(global-set-key [f11] 'helm-semantic-or-imenu)


;Helm descbinds helps to easily search for keyboard shortcuts for modes that are currently active in the project
(use-package helm-descbinds
:ensure t
:bind ("C-h b" . helm-descbinds))


;; (use-package lsp-treemacs
;;   :after (lsp-mode treemacs)
;;   :ensure t
;;   :commands lsp-treemacs-errors-list
;;   :bind (:map lsp-mode-map
;;          ("M-9" . lsp-treemacs-errors-list)))

;; (use-package treemacs
;;   :ensure t
;;   :commands (treemacs)
;;   :after (lsp-mode))


;(use-package helm-lsp
;:ensure t
;:after (lsp-mode)
;:commands (helm-lsp-workspace-symbol)
;:init (define-key lsp-mode-map [remap xref-find-apropos] #'helm-lsp-workspace-symbol))


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
(setq-default truncate-lines t)

;Company box, para toltip de ayuda.
;; With use-package:
;(use-package company-box
;  :hook (company-mode . company-box-mode))

;Commet y descommet
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)

; Ido mode (Better autocompletion in the mini buffer)
;(ido-mode)


;Inicializ Emacs server para sea mas rapido abrir archivos desde la terminal
;emacsclient file.java // By example
(server-start) ;Ya no sera necesario con el plugin zsh emacs.

;Wrap lines o no 
;M-x toggle-truncate-lines

;if your lines wrap hard at the right-hand edge of the window,
;M-x visual-line-mode

;Control-Alt-n Encuentra su otro parentesis
;C-M-n forward-sexp
;C-M-b backward-sexp
(global-set-key (kbd "C-c n") 'forward-sexp)
(global-set-key (kbd "C-c b") 'backward-sexp)

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
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/badger-theme")
(load-theme 'badger t)
(set-face-background 'region "gray37") ;Adecuado para theme badger
;Buena refencia:
; https://github.com/howardabrams/dot-files/blob/master/emacs.org
; https://www.youtube.com/watch?v=dljNabciEGg&t=245s&ab_channel=HowardAbrams

(add-to-list 'custom-theme-load-path "/home/guillermo/.emacs.d/themes/darkburn-theme")
;(load-theme 'darkburn t)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/challenger-deep-theme")
;(load-theme 'challenger-deep t)

;(load-theme 'sanityinc-tomorrow-night t)


;Nyan mode (Gatito)
(nyan-mode)

;(add-to-list 'load-path "~/.emacs.d/plugins/emacs-neotree/")
;(require 'neotree)
;(global-set-key [f12] 'neotree-toggle)


(use-package neotree
:ensure t
:config
(setq neo-theme 'icons)
(global-set-key [f9] 'neotree-toggle))



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
; Enable autopair in all buffers
(electric-pair-mode) 

;; disable {} auto pairing in electric-pair-mode for web-mode
;https://www.topbug.net/blog/2016/09/29/emacs-disable-certain-pairs-for-electric-pair-mode/
(add-hook
 'web-mode-hook
 (lambda ()
   (setq-local electric-pair-inhibit-predicate
               `(lambda (c)
                  (if (char-equal c ?{) t (,electric-pair-inhibit-predicate c))))))


;(add-to-list 'custom-theme-load-path "/home/guillermo/.emacs.d/themes/aanila")
;(load-theme 'aanila' t)
;(add-to-list 'custom-theme-load-path "/home/guillermo/.emacs.d/themes/avk-emacs-themes")
;(load-theme 'avk-darkblue-white' t)
;(load-theme 'avk-darkblue-yellow' t)

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
;Amarillo bonito #F0DFAF
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(linum ((t (:inherit (shadow default) :background "#171717" :foreground "#F0DFAF"))))) ;badger
; '(linum ((t (:inherit (shadow default) :background "#1B182C" :foreground "#F0DFAF"))))) ;challenger-deep
; '(linum ((t (:inherit (shadow default) :background "#191935" :foreground "#F0DFAF"))))) ;darkburn 
 ;Lineas amarillas #F0DFAF



;'(linum ((t (:inherit (shadow default) :background "#1D252C" :foreground "#B5B54A"))))) ;city-light
;Cambiar el color de la franja de los numeros
;(set-face-attribute 'fringe nil :background "#1D252C")
;(set-face-attribute 'fringe nil :background "#111111")
;Linea negra
(set-face-attribute 'fringe nil :background "#171717") ; badger

;(setq-default left-fringe-width 11)

;Modifica los espacion 4 for C/C++
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

;(setq langtool-language-tool-jar "~/bin/LanguageTool-5.1/languagetool-commandline.jar")
;(require 'langtool)

;; (global-set-key "\C-x4w" 'langtool-check)
;; (global-set-key "\C-x4W" 'langtool-check-done)
;; (global-set-key "\C-x4l" 'langtool-switch-default-language)
;; (global-set-key "\C-x44" 'langtool-show-message-at-point)
;; (global-set-key "\C-x4c" 'langtool-correct-buffer)
;(setq langtool-default-language "en-US")


(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "C-x g") 'goto-line)

;jump function M.]  dump-jump
;(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)

(use-package rainbow-delimiters
:ensure t
:defer t
:config
(add-hook 'prog-mode-hook #'prog-delimiters-mode))

;(add-hook 'c-mode-hook 'flycheck-mode)
;(add-hook 'c++-mode-hook 'flycheck-mode)
;(add-hook 'java-mode-hook 'flycheck-mode)
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

;; (use-package doom-modeline
;;   :ensure t
;;   :init (doom-modeline-mode 1))


;; (use-package doom-modeline
;;   :ensure t
;;   :hook (after-init . doom-modeline-mode))

;Genera un menu de ayuda con para las prefix command.
(use-package which-key 
:ensure t 
:init
(which-key-mode)
)

;Ejecuta programas
;Lo he probado con un programa de java que contiene el metodo main.
(use-package quickrun 
:ensure t
:bind ("C-c r" . quickrun))

;Automatizar mis plugins para que se instalen solos si no los tengo.
;; (use-package yasnippet :config (yas-global-mode))
;; (use-package yasnippet-snippets :ensure t)
;; (use-package flycheck :ensure t :init (global-flycheck-mode))


;@refernce
;https://github.com/neppramod/java_emacs/blob/master/emacs-configuration.org
;Solo funciona con la version reciente de java 11, asi tienes que cambiar tu java8 a java 11
;ensure t - Signigica que use-package ira a buscar el paquete si no tienes descargado.
(use-package lsp-mode
:ensure t
;; :hook (
;;    (lsp-mode . lsp-enable-which-key-integration)
;;    (java-mode . #'lsp-deferred)
;; )
:init (setq 
    ;; lsp-keymap-prefix "C-c l"              ; this is for which-key integration documentation, need to use lsp-mode-map
    ;; lsp-enable-file-watchers nil
    read-process-output-max (* 1024 1024)  ; 1 mb
    lsp-completion-provider :capf
    lsp-idle-delay 0.500
)
:config 
    ;; (setq lsp-intelephense-multi-root nil) ; don't scan unnecessary projects
    ;; (with-eval-after-load 'lsp-intelephense
    ;; (setf (lsp--client-multi-root (gethash 'iph lsp-clients)) nil))
	;; (define-key lsp-mode-map (kbd "C-c l") lsp-command-map)
	(global-set-key (kbd "C-c l") 'helm-lsp-code-actions)
)

(use-package lsp-java 
:ensure t
;; :config (add-hook 'java-mode-hook 'lsp)
)

;; (use-package lsp-ui
;; :ensure t
;; :after (lsp-mode)
;; :bind (:map lsp-ui-mode-map
;;          ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
;;          ([remap xref-find-references] . lsp-ui-peek-find-references))
;; :init (setq lsp-ui-doc-delay 1.5
;;       lsp-ui-doc-position 'bottom
;; 	  lsp-ui-doc-max-width 100
;; ))

(use-package treemacs
  :ensure t
  :config
  (global-set-key [f12] 'treemacs)
  (global-set-key (kbd "C-c p") 'treemacs-add-project)
  )


;; (use-package neotree
;; :ensure t
;; :config
;; (setq neo-theme 'icons)
;; (global-set-key [f12] 'neotree-toggle))
    
	
	

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(color-theme-sanityinc-tomorrow helm-lsp quickrun company-bootstrap doom-modeline multiple-cursors flymd company-box company-quickhelp mode-icons yasnippet-snippets which-key web-mode use-package rainbow-delimiters projectile nyan-mode neotree magit lsp-java langtool kaolin-themes impatient-mode highlight-numbers highlight-escape-sequences helm google-translate flycheck exec-path-from-shell emmet-mode eglot dumb-jump doom-themes define-word dashboard counsel company-web company-c-headers all-the-icons ac-html-csswatcher ac-html ac-clang ac-capf ac-c-headers)))

 


