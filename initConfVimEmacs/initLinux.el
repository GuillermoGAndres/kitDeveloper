;------------------------------Melpa------------------------------------------------------------ 
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
;; (setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing
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

;(require 'kaolin-themes)
;(load-theme 'kaolin-dark t)

;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/rebecca-theme")
;(load-theme #'rebecca t)

;Ocultar tool bar 
(tool-bar-mode -1)
(menu-bar-mode -1)
;Destacar la línea actual
;(global-hl-line-mode +1)
(if window-system
    (menu-bar-mode 1)
)

;------auto-complete tags popups of html in  html y web mode-------
;; (defun setup-ac-for-html ()
;;   ;; Require ac-haml since we are setup haml auto completion
;;   (require 'ac-html)
;;   ;; Require default data provider if you want to use
;;   (require 'ac-html-default-data-provider)
;;   ;; Enable data providers,
;;   ;; currently only default data provider available
;;   (ac-html-enable-data-provider 'ac-html-default-data-provider)
;;   ;; Let ac-haml do some setup
;;   (ac-html-setup)
;;   ;; Set your ac-source
;;   (setq ac-sources '(ac-source-html-tag
;;                      ac-source-html-attr
;;                      ac-source-html-attrv))
;;   ;; Enable auto complete mode
;;   (auto-complete-mode))

;; (add-hook 'html-mode-hook 'setup-ac-for-html)


;-------------------------------------


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


;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/modus-themes")
;(load-theme 'modus-vivendi t) 
;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/arc-dark-theme")
;(load-theme 'arc-dark t) 
;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-spacegray-theme")
;(load-theme 'spacegray t)

;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/city-lights-theme")
;(load-theme 'doom-city-lights-theme t)


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




;; (add-hook 'web-mode-hook (lambda ()
;;                           (set (make-local-variable 'company-backends) '(company-web-html))
;;                           (company-mode t)))

;--------------csswatcher (No supe que hac)
;(require 'ac-html-csswatcher)
;(company-web-csswatcher-setup)

; C (Ya no necesito este plugin, con company-mode lo hace ya porque tiene integrado clang)
;; (require 'ac-c-headers)
;; (add-hook 'c-mode-hook
;;           (lambda ()
;;             (add-to-list 'ac-sources 'ac-source-c-headers)
;;             (add-to-list 'ac-sources 'ac-source-c-header-symbols t)))

;SHELL Python
;(add-hook 'inferior-python-mode-hook 'ac-capf-setup)

;Highlight

;; (add-hook 'prog-mode-hook '(lambda () 
;;         (highlight-regexp "%[[:alpha:]]\\|\\\\[[:alpha:]]")))


;All-the-icons (Falle en instalar iconos)
;(add-to-list 'load-path "~/.emacs.d/plugins/all-the-icons")
;(require 'all-the-icons)
;(use-package all-the-icons)
;(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

;Melpa dired-icon 
;(add-hook 'dired-mode-hook 'dired-icon-mode)

;highlight numbers

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
;(global-set-key [f5] 'revert-buffer)
;Evoid confirmation
(global-set-key [f5] (lambda () (interactive) (revert-buffer nil t)))

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


;--------------------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["black" "#E2434C" "#86B187" "#E0D063" "#84C452" "#E18CBB" "#8AC6F2" "white"])
 '(cua-mode t nil (cua-base))
 '(custom-safe-themes
   '("5b809c3eae60da2af8a8cfba4e9e04b4d608cb49584cb5998f6e4a1c87c057c4" "e074be1c799b509f52870ee596a5977b519f6d269455b84ed998666cf6fc802a" "5d09b4ad5649fea40249dd937eaaa8f8a229db1cec9a1a0ef0de3ccf63523014" "6b80b5b0762a814c62ce858e9d72745a05dd5fc66f821a1c5023b4f2a76bc910" "37a4701758378c93159ad6c7aceb19fd6fb523e044efe47f2116bc7398ce20c9" "3df5335c36b40e417fec0392532c1b82b79114a05d5ade62cfe3de63a59bc5c6" "7d708f0168f54b90fc91692811263c995bebb9f68b8b7525d0e2200da9bc903c" "2cdc13ef8c76a22daa0f46370011f54e79bae00d5736340a5ddfe656a767fddf" "3c2f28c6ba2ad7373ea4c43f28fcf2eed14818ec9f0659b1c97d4e89c99e091e" "f2927d7d87e8207fa9a0a003c0f222d45c948845de162c885bf6ad2a255babfd" "c4bdbbd52c8e07112d1bfd00fee22bf0f25e727e95623ecb20c4fa098b74c1bd" "e1ef2d5b8091f4953fe17b4ca3dd143d476c106e221d92ded38614266cea3c8b" "990e24b406787568c592db2b853aa65ecc2dcd08146c0d22293259d400174e37" "d5a878172795c45441efcd84b20a14f553e7e96366a163f742b95d65a3f55d71" "71e5acf6053215f553036482f3340a5445aee364fb2e292c70d9175fb0cc8af7" "2f1518e906a8b60fac943d02ad415f1d8b3933a5a7f75e307e6e9a26ef5bf570" "37144b437478e4c235824f0e94afa740ee2c7d16952e69ac3c5ed4352209eefb" "bf387180109d222aee6bb089db48ed38403a1e330c9ec69fe1f52460a8936b66" "4bca89c1004e24981c840d3a32755bf859a6910c65b829d9441814000cf6c3d0" "e6ff132edb1bfa0645e2ba032c44ce94a3bd3c15e3929cdf6c049802cf059a2a" "b5fff23b86b3fd2dd2cc86aa3b27ee91513adaefeaa75adc8af35a45ffb6c499" "9efb2d10bfb38fe7cd4586afb3e644d082cbcdb7435f3d1e8dd9413cbe5e61fc" "a3b6a3708c6692674196266aad1cb19188a6da7b4f961e1369a68f06577afa16" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "8d7684de9abb5a770fbfd72a14506d6b4add9a7d30942c6285f020d41d76e0fa" "d7491c599885571b264596b825f9d37af4eba08bf09d9645f955f46059481cdc" "9724b3abaf500b227faa036dcf817abed9764802835ba6e8d1e475c877205157" "1de8de5dddd3c5138e134696180868490c4fc86daf9780895d8fc728449805f3" "c1c459af570241993823db87096bc775506c378aa02c9c6cd9ccaa8247056b96" "bb28b083fe1c61848c10c049be076afc572ea9bee6e1f8dc2631c5ee4f7388c8" "6a0d7f41968908e25b2f56fa7b4d188e3fc9a158c39ef680b349dccffc42d1c8" "c342ef444e7aca36f4b39a8e2848c4ba793d51c58fdb520b8ed887766ed6d40b" "10845272b6fa47a6cdfc49816748bdb1dc1cb9be647801c25c054a8e6a27ef72" "643b4d181b6afa4306d65db76889d8b987e095ae8f262a4c71dd5669d39c9b09" "7e5d400035eea68343be6830f3de7b8ce5e75f7ac7b8337b5df492d023ee8483" "c499bf4e774b34e784ef5a104347b81c56220416d56d5fd3fd85df8704260aad" "fc0fe24e7f3d48ac9cf1f87b8657c6d7a5dd203d5dabd2f12f549026b4c67446" "8ce796252a78d1a69e008c39d7b84a9545022b64609caac98dc7980d76ae34e3" "17a58e509bbb8318abf3558c4b7b44273b4f1b555c5e91d00d4785b7b59d6d28" "9ef81da35ce99a4c7155db7d46e4f8c20a51860d6879cf082e3ed1c5222c17d3" "e068203104e27ac7eeff924521112bfcd953a655269a8da660ebc150c97d0db8" "9089d25e2a77e6044b4a97a2b9fe0c82351a19fdd3e68a885f40f86bbe3b3900" default))
 '(fci-rule-color "#4C4A4D")
 '(jdee-db-active-breakpoint-face-colors (cons "#19181A" "#FCFCFA"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#19181A" "#A9DC76"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#19181A" "#727072"))
 '(objed-cursor-color "#CC6666")
 '(package-selected-packages
   '(langtool google-translate define-word ivy dumb-jump magit highlight-escape-sequences highlight-numbers ac-html-csswatcher ac-capf markdown-mode ac-c-headers ## company-web company yasnippet-snippets flycheck ac-clang nyan-mode helm ac-html impatient-mode emmet-mode web-mode kaolin-themes auto-complete))
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


