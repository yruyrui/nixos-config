;; -*- lexical-binding: t -*-
;;; init.el --- Emacs Initialization File

(eval-and-compile
  (when (or load-file-name byte-compile-current-file)
    (setq user-emacs-directory
          (expand-file-name
           (file-name-directory (or load-file-name byte-compile-current-file))))))

(eval-and-compile
  (customize-set-variable
   'package-archives '(("gnu"   . "https://elpa.gnu.org/packages/")
                       ("melpa" . "https://melpa.org/packages/")
                       ("org"   . "https://orgmode.org/elpa/")))
  (package-initialize)
  (unless (package-installed-p 'leaf)
    (package-refresh-contents)
    (package-install 'leaf))

  (leaf leaf-keywords
    :ensure t
    :init
    ;; optional packages if you want to use :hydra, :el-get, :blackout,,,
    (leaf hydra :ensure t)
    (leaf el-get :ensure t)
    (leaf blackout :ensure t)

    :config
    ;; initialize leaf-keywords.el
    (leaf-keywords-init)))


(global-display-line-numbers-mode t)


;; Theme setting
(require-theme 'modus-themes)

;; Your customizations here.  All customizations must be evaluated
;; BEFORE loading the theme.  Reload the theme for new customizations
;; to take effect.
(setq modus-themes-bold-constructs t
      modus-themes-italic-constructs t)

(modus-themes-load-theme 'modus-vivendi)

(define-key global-map (kbd "<f5>") #'modus-themes-toggle)

;; LSP
(leaf eglot
  :hook
  (c-mode . eglot-ensure)
  (c++-mode . eglot-ensure)
  (html-mode . eglot-ensure)
  (python-mode . eglot-ensure)
  (typescript-mode . eglot-ensure)
  )


(provide 'init)

;;; init.el ends here
