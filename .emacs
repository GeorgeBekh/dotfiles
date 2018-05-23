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
 '(initial-buffer-choice "~/")
 '(js-indent-level 2)
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (groovy-mode clojure-mode yasnippet-snippets yaml-mode web-mode use-package restclient projectile multiple-cursors magit js2-mode iy-go-to-char iedit flymake-php dockerfile-mode diff-hl ac-php)))
 '(projectile-globally-ignored-directories
   (quote
    (".idea" ".eunit" ".git" ".hg" ".fslckout" ".bzr" "_darcs" "venv" "node_modules")))
 '(require-final-newline t)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq default-input-method "cyrillic-yawerty")

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(setq explicit-shell-file-name "/bin/bash") ;; grep doesn't work in fish
(setq shell-file-name "/bin/bash") ;; grep fix
(setq confirm-kill-emacs 'y-or-n-p)

(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

(use-package projectile)
(use-package magit)
(use-package js2-mode)
(use-package diff-hl)
(use-package web-mode)
(use-package yaml-mode)
(use-package flymake-php)
(use-package iy-go-to-char)
(use-package auto-complete)
(use-package ac-php)
(use-package php-mode)
(use-package yasnippet)
(use-package yasnippet-snippets)
(use-package dockerfile-mode)
(use-package multiple-cursors)
(use-package restclient)
(use-package iedit)

(global-set-key (kbd "M-i") 'back-to-indentation)
(global-set-key (kbd "M-m") 'iy-go-to-char)
(global-set-key (kbd "M-M") 'iy-go-to-char-backward)

(global-set-key (kbd "C-S-c") 'mc/edit-lines)

(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

(global-set-key (kbd "C-c g") 'browse-url-at-point)

(projectile-global-mode)
(global-diff-hl-mode)
(show-paren-mode t)
(setq show-paren-style 'expression)
(windmove-default-keybindings)

(yas-global-mode 1)
(add-hook 'yas-minor-mode-hook
          (lambda ()
            (yas-activate-extra-mode 'fundamental-mode)))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(ac-config-default)
(global-auto-complete-mode t)
(set-default 'ac-sources
             '(ac-source-yasnippet
               ac-source-words-in-buffer
               ac-source-words-in-same-mode-buffers))
(setq ac-delay 0.5)

(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")

(add-hook 'php-mode-hook
          '(lambda ()
             (auto-complete-mode t)
             (use-package ac-php)
             (setq ac-sources  '(ac-source-php ) )
             (ac-php-core-eldoc-setup ) ;; enable eldoc
             (setq c-basic-offset 4)
             (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
             (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back)    ;go back
             ))

(add-hook 'php-mode-hook 'flymake-php-load)
(add-hook 'js2-mode-hook
          (lambda ()
            (make-local-variable 'js-indent-level)
            (setq js-indent-level 2)
            (setq js-switch-indent-offset 2)
            ))

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.twig?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
