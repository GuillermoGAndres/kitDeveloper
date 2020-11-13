;;;;------------------------------Melpa------------------------------------------------------------ 
(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`

;; and `package-pinned-packages`. Most users will not need or want to do this.

;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)

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
(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing
;; (global-set-key (kbd "C-c /") 'company-files)        ; Force complete file names on "C-c /" key


;Initialization company
(add-hook 'after-init-hook 'global-company-mode)
;; manual autocomplete
;(global-set-key (kbd "M-RET") 'company-complete)
(global-set-key (kbd "<C-return>") 'company-complete)

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

;-------------------------------------
;Aumentar tamaño de letra
(set-face-attribute 'default nil :height 130)
;Agregar numeros de lineas
;@reference: https://emacs.stackexchange.com/questions/278/how-do-i-display-line-numbers-in-emacs-not-in-the-mode-line
(add-hook 'prog-mode-hook 'linum-mode)
;@see: https://www.emacswiki.org/emacs/ShowParenMode
;Matches parentesis
(show-paren-mode 1)

;Ese theme tambien me gusto
;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/badger-theme")
;(load-theme 'badger t)

(add-to-list 'load-path "~/.emacs.d/plugins/emacs-neotree/")
(require 'neotree)
(global-set-key [f12] 'neotree-toggle)


;Ocultar tool bar 
(tool-bar-mode -1)
(menu-bar-mode -1)
;Destacar la línea actual
;(global-hl-line-mode +1)
(if window-system
    (menu-bar-mode 1)
)

;Don't show intro
;(setq inhibit-startup-message t)

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




;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/challenger-deep-theme")
;(load-theme 'challenger-deep t)

;permanently enable syntax checking with Flycheck
(add-hook 'after-init-hook #'global-flycheck-mode) 

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
;(global-set-key (kbd "<C-x <up>") tab-bar-switch-to-next-tab)
;(global-set-key (kbd "<C-x <down>") tab-bar-switch-to-prev-tab)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)



;------------------------------Web mode-

;Agrega los archivos.html web mode
(require 'web-mode) 
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
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

;; manual autocomplete
(define-key web-mode-map (kbd "M-RET") 'company-complete)


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



;jump function M.
(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)
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
(add-hook 'c++-mode-hook 'flyspell-prog-mode)

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
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
;(helm-mode 1)

(global-set-key [f11] 'helm-semantic-or-imenu)

(global-set-key (kbd "C-x g") 'goto-line)

;(require 'lsp-java)
;(add-hook 'java-mode-hook #'lsp)

;--------------------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["black" "#E2434C" "#86B187" "#E0D063" "#84C452" "#E18CBB" "#8AC6F2" "white"])
 '(custom-safe-themes '("" default))
 '(fci-rule-color "#4C4A4D")
 '(jdee-db-active-breakpoint-face-colors (cons "#19181A" "#FCFCFA"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#19181A" "#A9DC76"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#19181A" "#727072"))
 '(nil nil t)
 '(objed-cursor-color "#CC6666")
 '(package-selected-packages
   '(eglot lsp-mode lsp-java company-c-headers langtool google-translate define-word ivy dumb-jump magit highlight-escape-sequences highlight-numbers ac-html-csswatcher ac-capf markdown-mode ac-c-headers ## company-web company yasnippet-snippets flycheck ac-clang nyan-mode helm ac-html impatient-mode emmet-mode web-mode kaolin-themes auto-complete))
 '(pdf-view-midnight-colors (cons "#FCFCFA" "#2D2A2E"))
 '(pos-tip-background-color "#222225")
 '(pos-tip-foreground-color "#c8c8d0")
 '(rustic-ansi-faces
   ["#2D2A2E" "#CC6666" "#A9DC76" "#FFD866" "#78DCE8" "#FF6188" "#78DCE8" "#FCFCFA"])
 '(uniquify-buffer-name-style 'post-forward nil (uniquify))
 '(vc-annotate-background "#2D2A2E")
 '(vc-annotate-color-map
   (list
    (cons 20 "#A9DC76")
    (cons 40 "#c5da70")
    (cons 60 "#e2d96b")
    (cons 80 "#FFD866")
    (cons 100 "#fec266")
    (cons 120 "#fdad66")
    (cons 140 "#FC9867")
    (cons 160 "#fd8572")
    (cons 180 "#fe737d")
    (cons 200 "#FF6188")
    (cons 220 "#ee627c")
    (cons 240 "#dd6471")
    (cons 260 "#CC6666")
    (cons 280 "#b56869")
    (cons 300 "#9f6b6c")
    (cons 320 "#886d6f")
    (cons 340 "#4C4A4D")
    (cons 360 "#4C4A4D")))
 '(vc-annotate-very-old-color nil))


;Use impatient-mode
;M-x httpd-start
;M-x impatient-mode

;http://localhost:8080/imp/



