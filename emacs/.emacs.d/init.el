;; inspired by 
;; - http://www.aaronbedra.com/emacs.d/
;; - http://emacsrocks.com/

;; turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; 10MB garbage collection threshold (default 400k)
(setq-default gc-cons-threshold 10000000)

;; stuff that is always used
(require 'cl)
(require 'cl-lib)
(require 'saveplace)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)

;; no splash screen 
(setq inhibit-startup-message t)

;; me :)
(setq user-full-name "Pascal Kuendig"
      user-mail-address "padakuro@gmail.com")

;; keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; package management
(load "package")
(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(defvar padakuro/packages '(evil
                            magit
                            projectile
                            company
                            helm
                            helm-company
                            helm-projectile
                            neotree
                            alchemist
                            elixir-mode
                            yaml-mode
                            sass-mode
                            color-theme-sanityinc-tomorrow
                           )
"Default Packages")

(defun padakuro/packages-installed-p ()
  (loop for pkg in padakuro/packages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))

(unless (padakuro/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg padakuro/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; hide magit setup message
(setq magit-last-seen-setup-instructions "1.4.0")

;; appearance
(load-theme 'sanityinc-tomorrow-night)

;; disable auto-save-files (the # files)
(setq auto-save-default nil)

;; disable backup files (the ~ files)
(setq make-backup-files nil) 

;; save point position between sessions
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

;; configure tab display and disable tabs
(setq tab-width 2
      indent-tabs-mode nil)
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60
                      64 68 72 76 80 84 88 92 96 100 104 108 112
                      116 120))

;; abbreviate yes/no to y/n
(defalias 'yes-or-no-p 'y-or-n-p)

;; line numbers
(require 'linum)
(global-linum-mode 1)

;; also show the column number besides the line number in the mode line
(setq column-number-mode 1)

;;(require 'evil)
;;(evil-mode 1)

(require 'helm-config)
(require 'helm-projectile)
(helm-projectile-on)
(helm-mode 1)

(setq helm-idle-delay 0.0
      helm-input-idle-delay 0.01
      helm-quick-update t
      helm-M-x-requires-pattern nil
      helm-ff-skip-boring-files t
      helm-M-x-fuzzy-match t
      helm-projectile-fuzzy-match t)

(require 'company)
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 2)
(company-mode 1)

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

(add-hook 'after-init-hook 'global-company-mode)

(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

(defun iwb()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

(defun next-word (p)
   "Move point to the beginning of the next word, past any spaces"
   (interactive "d")
   (forward-word)
   (forward-word)
   (backward-word))

;; run command
(global-set-key (kbd "M-x") 'helm-M-x)
;; fuzzy find file in project
(global-set-key (kbd "C-x C-f") 'helm-projectile-find-file)
;; fuzzy find open buffer
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
;; save buffer
;; C-x C-s
;; close buffer
;; C-x k

;; trigger auto-complete
(global-set-key (kbd "C-SPC") 'company-complete)
;; search whole file
;; C-s
;; search whole file for word under cursor
;; Alt-s .
;; search&replace in whole file

;; search in project
;; search&replace in project

;; reformat whole file
(global-set-key (kbd "C-M-f") 'iwb)

;; close all windows excapt the current
;; C-x 1

;; delete selection
;; copy selection
;; reformat selection

;; next line
;; C-n
;; prev line
;; C-p
;; goto end of line
;; C-e
;; goto start of line
;; C-a
;; goto (fuzzy search) in line
;; delete from cursor position
;; C-k
;; delete whole line
(global-unset-key (kbd "C-d"))
(global-set-key (kbd "C-d C-d") 'kill-whole-line)
;; duplicate whole line
;; copy whole line

;; next word
(global-set-key (kbd "C-w") 'next-word)
;; prev word
(global-set-key (kbd "C-b") 'backward-word)
;; delete word under cursor
;; copy word under cursor
;; delete all between '' or ""
;; copy all between '' or ""

;; git revert current line
;; git revert selection

(cua-mode 1)

(set-frame-font "DejaVu Sans Mono-13")
