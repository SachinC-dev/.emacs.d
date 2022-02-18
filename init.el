(package-initialize)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://stable.melpa.org/packages/"))

(require 'package)
(require 'use-package)

(use-package evil
             :ensure t)

(evil-mode 1)

(use-package org
             :ensure t)

(use-package gruvbox-theme
             :ensure t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#3c3836" "#fb4933" "#b8bb26" "#fabd2f" "#83a598" "#d3869b" "#8ec07c" "#ebdbb2"])
 '(custom-enabled-themes '(gruvbox))
 '(custom-safe-themes
   '("1436d643b98844555d56c59c74004eb158dc85fc55d2e7205f8d9b8c860e177f" "a22f40b63f9bc0a69ebc8ba4fbc6b452a4e3f84b80590ba0a92b4ff599e53ad0" default))
 '(display-line-numbers-type 'relative)
 '(global-display-line-numbers-mode t)
 '(package-selected-packages '(evil-org org-bullets dashboard use-package))
 '(pdf-view-midnight-colors '("#fdf4c1" . "#1d2021")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "JetBrains Mono" :foundry "JB" :slant normal :weight normal :height 158 :width normal)))))
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-startup-banner "~/.emacs.d/goof.png")
  (setq dashborad-banner-logo-titile "A kid who like to code"))

;; Pair completion
(electric-pair-mode 1)

;; Indentation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(setq c-default-style "linux")
(setq c-basic-offset 4)
(c-set-offset 'comment-intro 0)

(setq initial-buffer-choice (lambda ()
(get-buffer "*dashboard*")))
(setq make-backup-files nil)

(use-package org-bullets
  :ensure t
  :after (evil org))
(use-package org-superstar
  :ensure t
  :config
  :(add-hook 'org-mode-hook (lambda () (org-superstart-mode 1))))

(use-package evil-org
  :ensure t
  :after (evil org)
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
            (lambda ()
              (evil-org-set-key-theme '(navigation
                                        insert
                                        textobjects
                                        additional
                                        calendar)))))
