;; -*- lexical-binding: t -*-

(menu-bar-mode -1)

;; disable backup feature
(setq make-backup-files nil
      auto-save-default nil
      auto-save-list-file-prefix nil
      create-lockfiles nil)

(setq inhibit-startup-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t)

(setq package-enable-at-startup nil)

(provide 'early-init)

;;; early-init.el --- Emacs Initialization File
