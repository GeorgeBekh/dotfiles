
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (tango-dark)))
 '(indent-tabs-mode nil)
 '(js-indent-level 2)
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (flymake-php diff-hl flymake-json flymake-jslint ac-php web-mode php-mode projectile yaml-mode rjsx-mode ## flymake-csslint)))
 '(projectile-globally-ignored-directories
   (quote
    (".idea" ".eunit" ".git" ".hg" ".fslckout" ".bzr" "_darcs" "venv")))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

(projectile-global-mode)
(global-linum-mode t)

(show-paren-mode t)
(setq show-paren-style 'expression)

(windmove-default-keybindings)

(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")) )
(package-initialize)
	(unless (package-installed-p 'ac-php )
	  (package-refresh-contents)
	  (package-install 'ac-php )
	  )
	(require 'cl)
	(require 'php-mode)
	(add-hook 'php-mode-hook
	          '(lambda ()
	             (auto-complete-mode t)
	             (require 'ac-php)
	             (setq ac-sources  '(ac-source-php ) )
	             (yas-global-mode 1)
	             (ac-php-core-eldoc-setup ) ;; enable eldoc

	             (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
	             (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back)    ;go back
	             ))

(require 'flymake-jslint)
(add-hook 'js2-mode-hook 'flymake-jslint-load)

(require 'flymake-json)
(add-hook 'json-mode 'flymake-json-load)

(require 'flymake-php)
(add-hook 'php-mode-hook 'flymake-php-load)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'js2-mode-hook
          (lambda ()
            (make-local-variable 'js-indent-level)
            (setq js-indent-level 2)))

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.twig?\\'" . web-mode))

(setq explicit-shell-file-name "/bin/bash") ;; grep doesn't work in fishsg
(setq shell-file-name "/bin/bash") ;; grep fix
(global-diff-hl-mode)
