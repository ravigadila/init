(require 'package)
(package-initialize)

;; Package archives
(setq package-archives
  '(("gnu" . "http://elpa.gnu.org/packages/")
    ("marmalade" . "https://marmalade-repo.org/packages/")
    ("melpa-stable" . "http://stable.melpa.org/packages/")))


;;To disable menu bar
(menu-bar-mode -1) 

;; To disable the tool bar
(tool-bar-mode -1) 

;; Python IDE settings
(elpy-enable)
(elpy-use-ipython)


;;;;org-mode configuration
;; Enable org-mode
(require 'org)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-log-done t)


;; Helm configuration
(require 'helm-config)
(helm-mode 1)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(global-set-key (kbd "C-x b") 'helm-buffers-list)



;; Web mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
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

;; load custome theame
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'blackboard t)
;; set Default font
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(set-default-font "Inconsolata")
(set-face-attribute 'default nil :height 130)

;; For displaying line numbers
(global-linum-mode t)

;; Git-Gutter
(global-git-gutter-mode +1)
