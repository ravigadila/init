(require 'package)
(package-initialize)

;; Package archives
(setq package-archives
  '(("gnu" . "http://elpa.gnu.org/packages/")
    ("marmalade" . "https://marmalade-repo.org/packages/")
    ("melpa-stable" . "http://stable.melpa.org/packages/")))

(add-to-list 'package-archives
              '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;;To disable menu bar
(menu-bar-mode -1) 

;; To disable the tool bar
(tool-bar-mode -1) 

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (dracula-theme elpy neotree ace-jump-mode web-mode helm))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Python IDE settings
(elpy-enable)
(elpy-use-ipython)
(add-to-list 'load-path "~/.emacs.d/elpa/")


;; Helm configuration
(require 'helm-config)
(helm-mode 1)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(global-set-key (kbd "C-x b") 'helm-buffers-list)



;; Web mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
;; use web-mode for .jsx files
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-enable-auto-pairing t)
(setq web-mode-enable-css-colorization t)
(setq web-mode-enable-current-column-highlight t)
(setq web-mode-enable-current-element-highlight t)
(setq js-indent-level 2)
(setq web-mode-style-padding 2)
(setq web-mode-script-padding 2)
(setq web-mode-block-padding 0)
;; Web mode autocomplete
(setq web-mode-ac-sources-alist
  '(("css" . (ac-source-css-property))
    ("html" . (ac-source-words-in-buffer ac-source-abbrev))))
(setq-default indent-tabs-mode nil)
(add-hook 'sgml-mode-hook
        (lambda ()
          ;; Default indentation to 2, but let SGML mode guess, too.
          (set (make-local-variable 'sgml-basic-offset) 2)
          (sgml-guess-indent)))
(add-hook 'html-mode-hook
              (lambda ()
                (setq indent-line-function 'indent-relative)))


;; set Default font
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(set-default-font "Inconsolata")
(set-face-attribute 'default nil :height 130)

(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)


;; (add-to-list 'load-path "/home/ravi/.emacs.d/packages/emacs-neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; custome key bindings
(global-set-key (kbd "C-,") 'rgrep)
(global-set-key (kbd "C-j") 'comment-region)
(global-set-key (kbd "C-l") 'uncomment-region)


;; load theme
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/elpa")
(load-theme 'dracula t)
(require 'smartparens-config)
(smartparens-global-mode t)
(global-set-key (kbd "C-M-a") 'sp-beginning-of-sexp)
(global-set-key (kbd "C-M-e") 'sp-end-of-sexp)

(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))

(add-hook 'web-mode-hook
  (lambda ()
  (if (equal web-mode-content-type "javascript")
  (web-mode-set-content-type "jsx")
  (message "now set to: %s" web-mode-content-type))))

(setq web-mode-content-types-alist
  '(("jsx" . "\\.js[x]?\\'")))
