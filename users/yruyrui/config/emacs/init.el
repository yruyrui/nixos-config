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

(leaf cmake-mode :ensure t)
(leaf nix-mode :ensure t)

(leaf eglot
  :ensure t
  :config
  (add-to-list 'eglot-server-programs '(nix-mode . ("nil")))
  :hook
  (c-mode . eglot-ensure)
  (c++-mode . eglot-ensure)
  (cmake-mode . eglot-ensure)
  (html-mode . eglot-ensure)
  (nix-mode . eglot-ensure)
  (python-mode . eglot-ensure)
  (sh-mode . eglot-ensure)
  (typescript-mode . eglot-ensure))


(leaf company
  :doc "Modular text completion framework"
  :req "emacs-24.3"
  :tag "matching" "convenience" "abbrev" "emacs>=24.3"
  :url "http://company-mode.github.io/"
  :emacs>= 24.3
  :ensure t
  :blackout t
  :leaf-defer nil
  :bind ((company-active-map
          ("M-n" . nil)
          ("M-p" . nil)
          ("C-s" . company-filter-candidates)
          ("C-n" . company-select-next)
          ("C-p" . company-select-previous)
          ("<tab>" . company-complete-selection))
         (company-search-map
          ("C-n" . company-select-next)
          ("C-p" . company-select-previous)))
  :custom ((company-idle-delay . 0)
           (company-minimum-prefix-length . 1)
           (company-transformers . '(company-sort-by-occurrence)))
  :global-minor-mode global-company-mode)

(leaf company-c-headers
  :doc "Company mode backend for C/C++ header files"
  :req "emacs-24.1" "company-0.8"
  :tag "company" "development" "emacs>=24.1"
  :added "2020-03-25"
  :emacs>= 24.1
  :ensure t
  :after company
  :defvar company-backends
  :config
  (add-to-list 'company-backends 'company-c-headers))


(provide 'init)

;;; init.el ends here
