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
(ac-config-default)
(global-auto-complete-mode t)
;Aumentar tamaño de letra
(set-face-attribute 'default nil :height 120)
;Agregar numeros de lineas
;@reference: https://emacs.stackexchange.com/questions/278/how-do-i-display-line-numbers-in-emacs-not-in-the-mode-line
(add-hook 'prog-mode-hook 'linum-mode)
;@see: https://www.emacswiki.org/emacs/ShowParenMode
;Matches parentesis
(show-paren-mode 1)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/badger-theme")
;(load-theme 'badger t)

(add-to-list 'load-path "~/.emacs.d/plugins/emacs-neotree/")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

(require 'kaolin-themes)
(load-theme 'kaolin-dark t)

;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/rebecca-theme")
;(load-theme #'rebecca t)

;Ocultar tool bar 
(tool-bar-mode -1)
(menu-bar-mode -1)
(if window-system
    (menu-bar-mode 1)
)

;--------------------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["black" "#E2434C" "#86B187" "#E0D063" "#84C452" "#E18CBB" "#8AC6F2" "white"])
 '(custom-safe-themes
   '("9724b3abaf500b227faa036dcf817abed9764802835ba6e8d1e475c877205157" "1de8de5dddd3c5138e134696180868490c4fc86daf9780895d8fc728449805f3" "c1c459af570241993823db87096bc775506c378aa02c9c6cd9ccaa8247056b96" "bb28b083fe1c61848c10c049be076afc572ea9bee6e1f8dc2631c5ee4f7388c8" "6a0d7f41968908e25b2f56fa7b4d188e3fc9a158c39ef680b349dccffc42d1c8" "c342ef444e7aca36f4b39a8e2848c4ba793d51c58fdb520b8ed887766ed6d40b" "10845272b6fa47a6cdfc49816748bdb1dc1cb9be647801c25c054a8e6a27ef72" "643b4d181b6afa4306d65db76889d8b987e095ae8f262a4c71dd5669d39c9b09" "7e5d400035eea68343be6830f3de7b8ce5e75f7ac7b8337b5df492d023ee8483" "c499bf4e774b34e784ef5a104347b81c56220416d56d5fd3fd85df8704260aad" "fc0fe24e7f3d48ac9cf1f87b8657c6d7a5dd203d5dabd2f12f549026b4c67446" "8ce796252a78d1a69e008c39d7b84a9545022b64609caac98dc7980d76ae34e3" "17a58e509bbb8318abf3558c4b7b44273b4f1b555c5e91d00d4785b7b59d6d28" "9ef81da35ce99a4c7155db7d46e4f8c20a51860d6879cf082e3ed1c5222c17d3" "e068203104e27ac7eeff924521112bfcd953a655269a8da660ebc150c97d0db8" "9089d25e2a77e6044b4a97a2b9fe0c82351a19fdd3e68a885f40f86bbe3b3900" default))
 '(package-selected-packages '(kaolin-themes auto-complete))
 '(pos-tip-background-color "#222225")
 '(pos-tip-foreground-color "#c8c8d0"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
