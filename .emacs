
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
    (yasnippet-snippets iy-go-to-char flymake-php diff-hl flymake-json flymake-jslint ac-php web-mode php-mode projectile yaml-mode rjsx-mode ## flymake-csslint)))
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
(setq explicit-shell-file-name "/bin/bash") ;; grep doesn't work in fish
(setq shell-file-name "/bin/bash") ;; grep fix

(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))

(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

(use-package projectile)
(use-package magit)
(use-package js2-mode)
(use-package ac-php)
(use-package diff-hl)
(use-package web-mode)
(use-package yaml-mode)
(use-package flymake-jslint)
(use-package flymake-json)
(use-package flymake-php)
(use-package iy-go-to-char)
(use-package org)
(use-package yasnippet)
(use-package yasnippet-snippets)

(global-set-key (kbd "C-c f") 'iy-go-to-char)
(global-set-key (kbd "C-c F") 'iy-go-to-char-backward)
(global-set-key (kbd "C-c ;") 'iy-go-to-or-up-to-continue)
(global-set-key (kbd "C-c ,") 'iy-go-to-or-up-to-continue-backward)

(projectile-global-mode)
(global-diff-hl-mode)
(show-paren-mode t)
  (setq show-paren-style 'expression)
(windmove-default-keybindings)
(yas-global-mode 1)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

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

(add-hook 'js2-mode-hook 'flymake-jslint-load)
(add-hook 'json-mode 'flymake-json-load)
(add-hook 'php-mode-hook 'flymake-php-load)
(add-hook 'js2-mode-hook
          (lambda ()
            (make-local-variable 'js-indent-level)
            (setq js-indent-level 2)))

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.twig?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
