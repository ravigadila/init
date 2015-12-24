(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(menu-bar-mode nil)
 '(package-archives (quote (("gnu" . "http://elpa.gnu.org/packages/") ("melpa" . "https://stable.melpa.org/packages/"))))
 '(tool-bar-mode nil))

(add-to-list 'default-frame-alist '(fullscreen . maximized))
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(elpy-enable)
(elpy-use-ipython)

;; ---------------------------------------
;; load elscreen
;; ---------------------------------------
(load "elscreen" "ElScreen" t)
;; F9 creates a new elscreen, shift-F9 kills it
(global-set-key (kbd "C-c t a b e") 'elscreen-create)
(global-set-key (kbd "C-c t a b d") 'elscreen-kill)
(global-set-key (kbd "C-j") 'delete-pair)
;; Windowskey+PgUP/PgDown switches between elscreens
(global-set-key (kbd "C-M-_") 'elscreen-previous)
(global-set-key (kbd "C-M-+") 'elscreen-next)
(elscreen-start)

;;winner mode enable on startup
(when (fboundp 'winner-mode)
      (winner-mode 1))

(add-to-list 'load-path "~/.emacs.d/emacs-w3m/")
(require 'w3m-load)
(setq w3m-use-cookies t)
(setq w3m-coding-system 'utf-8
          w3m-file-coding-system 'utf-8
          w3m-file-name-coding-system 'utf-8
          w3m-input-coding-system 'utf-8
          w3m-output-coding-system 'utf-8
          w3m-terminal-coding-system 'utf-8)

;; Font family
(set-default-font "DejaVu Sans Mono")

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-enable-auto-pairing t)
(setq web-mode-enable-css-colorization t)
(setq web-mode-enable-current-column-highlight t)
(setq web-mode-enable-current-element-highlight t)
(setq web-mode-ac-sources-alist
  '(("css" . (ac-source-css-property))
    ("html" . (ac-source-words-in-buffer ac-source-abbrev))))

(setq js-indent-level 2)
;;web mode tabs nill
(setq-default indent-tabs-mode nil)

(add-hook 'sgml-mode-hook
        (lambda ()
          ;; Default indentation to 2, but let SGML mode guess, too.
          (set (make-local-variable 'sgml-basic-offset) 2)
          (sgml-guess-indent)))

(add-hook 'html-mode-hook
              (lambda ()
                (setq indent-line-function 'indent-relative)))

(load-file "/home/ravi/.emacs.d/cedet-1.1/common/cedet.el")
(global-ede-mode 1)                      ; Enable the Project management system
(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
(global-srecode-minor-mode 1)            ; Enable template insertion menu

;; Helm configuration
(require 'helm-config)
(helm-mode 1)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(global-set-key (kbd "C-x b") 'helm-buffers-list)

;; load emacs theam
(global-linum-mode t) ;; enable line numbers globally
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'blackboard t)
(set-face-attribute 'default nil :height 110)

;;Org mode emacs
(require 'org)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-log-done t)
