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
(global-set-key (kbd "M-RET") 'company-complete)


;-------------------------------------
;Aumentar tamaño de letra
(set-face-attribute 'default nil :height 130)
;Agregar numeros de lineas
;@reference: https://emacs.stackexchange.com/questions/278/how-do-i-display-line-numbers-in-emacs-not-in-the-mode-line
(add-hook 'prog-mode-hook 'linum-mode)
;@see: https://www.emacswiki.org/emacs/ShowParenMode
;Matches parentesis
(show-paren-mode 1)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/badger-theme")
(load-theme 'badger t)

(add-to-list 'load-path "~/.emacs.d/plugins/emacs-neotree/")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

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
(global-set-key (kbd "M-x") 'helm-M-x)

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

;--------------------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["black" "#E2434C" "#86B187" "#E0D063" "#84C452" "#E18CBB" "#8AC6F2" "white"])
 '(custom-safe-themes
   '("b5fff23b86b3fd2dd2cc86aa3b27ee91513adaefeaa75adc8af35a45ffb6c499" "9efb2d10bfb38fe7cd4586afb3e644d082cbcdb7435f3d1e8dd9413cbe5e61fc" "a3b6a3708c6692674196266aad1cb19188a6da7b4f961e1369a68f06577afa16" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "8d7684de9abb5a770fbfd72a14506d6b4add9a7d30942c6285f020d41d76e0fa" "d7491c599885571b264596b825f9d37af4eba08bf09d9645f955f46059481cdc" "9724b3abaf500b227faa036dcf817abed9764802835ba6e8d1e475c877205157" "1de8de5dddd3c5138e134696180868490c4fc86daf9780895d8fc728449805f3" "c1c459af570241993823db87096bc775506c378aa02c9c6cd9ccaa8247056b96" "bb28b083fe1c61848c10c049be076afc572ea9bee6e1f8dc2631c5ee4f7388c8" "6a0d7f41968908e25b2f56fa7b4d188e3fc9a158c39ef680b349dccffc42d1c8" "c342ef444e7aca36f4b39a8e2848c4ba793d51c58fdb520b8ed887766ed6d40b" "10845272b6fa47a6cdfc49816748bdb1dc1cb9be647801c25c054a8e6a27ef72" "643b4d181b6afa4306d65db76889d8b987e095ae8f262a4c71dd5669d39c9b09" "7e5d400035eea68343be6830f3de7b8ce5e75f7ac7b8337b5df492d023ee8483" "c499bf4e774b34e784ef5a104347b81c56220416d56d5fd3fd85df8704260aad" "fc0fe24e7f3d48ac9cf1f87b8657c6d7a5dd203d5dabd2f12f549026b4c67446" "8ce796252a78d1a69e008c39d7b84a9545022b64609caac98dc7980d76ae34e3" "17a58e509bbb8318abf3558c4b7b44273b4f1b555c5e91d00d4785b7b59d6d28" "9ef81da35ce99a4c7155db7d46e4f8c20a51860d6879cf082e3ed1c5222c17d3" "e068203104e27ac7eeff924521112bfcd953a655269a8da660ebc150c97d0db8" "9089d25e2a77e6044b4a97a2b9fe0c82351a19fdd3e68a885f40f86bbe3b3900" default))
 '(package-selected-packages
   '(ac-html-csswatcher ac-capf markdown-mode ac-c-headers ## company-web company yasnippet-snippets flycheck ac-clang nyan-mode helm ac-html impatient-mode emmet-mode web-mode kaolin-themes auto-complete))
 '(pos-tip-background-color "#222225")
 '(pos-tip-foreground-color "#c8c8d0"))




;Use impatient-mode
;M-x httpd-start
;M-x impatient-mode

;http://localhost:8080/imp/


