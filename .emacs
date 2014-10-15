(setq inhibit-splash-screen t)

;; stuff off the gui, 
(menu-bar-mode -1)
(tool-bar-mode -1)

;; package stuff
(require 'package)
(add-to-list 'package-archives
         '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
(add-to-list 'package-archives
         '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize) 
;; check if the packages is installed; if not, install it.
(mapc
 (lambda (package)
   (or (package-installed-p package)
       (package-install package)))
 '(magit rainbow-mode jedi helm evil puppet-mode
      flymake
      puppetfile-mode flymake-puppet
      flymake-jshint helm-flymake flymake-json
      flyspell-lazy
      flatland-theme
      yaml-mode ace-jump-mode
      nginx-mode apache-mode
      twittering-mode multiple-cursors confluence browse-kill-ring
      python-mode flymake-python-pyflakes
      ssh-config-mode yasnippet monokai-theme
      web-mode
      project-explorer
      go-autocomplete go-mode
      rinari ruby-mode robe enh-ruby-mode flymake-ruby
      markdown-mode
      color-theme-solarize
      ))

;; whenever an external process changes a file underneath emacs, and there
;; was no unsaved changes in the corresponding buffer, just revert its
;; content to reflect what's on-disk.
(global-auto-revert-mode 1)

;; remove rst color schema
;;(setq 'rst-level-face-base-color "grey25")

;;(when (load "flymake" t)
;;  (defun flymake-pylint-init ()
;;    (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                       'flymake-create-temp-inplace))
;;           (local-file (file-relative-name
;;                        temp-file
;;                        (file-name-directory buffer-file-name))))
;;      (list "~/.emacs.d/misc/pyflymake.py" (list local-file))))
;;      ;;     check path
;;
;;  (add-to-list 'flymake-allowed-file-name-masks
;;               '("\\.py\\'" flymake-pylint-init)))
;;
;;(add-hook 'find-file-hook 'flymake-find-file-hook)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ido-enable-flex-matching t)
 '(safe-local-variable-values (quote ((encoding . utf-8))))
 '(show-paren-mode t)
 '(show-trailing-whitespace t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; tabs
;;(setq indent-tabs-mode nil)

;;(setq tab-width 4)
;;(setq indent-tabs-mode nil)

(add-hook 'after-change-major-mode-hook 
          '(lambda () 
             (setq-default indent-tabs-mode nil)
             (setq c-basic-indent 4)
             (setq tab-width 4)))



(defun my-rgrep ()
  "Search the current project."
  (interactive)
  (let ((default-directory
          (if vc-mode
              (vc-call-backend (vc-backend buffer-file-name) 'root default-directory)
            default-directory)))
    (call-interactively 'rgrep)))


;; multi cursors
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)


;; Automatically remove trailing whitespace when file is saved.
(add-hook 'python-mode-hook
      (lambda()
        (add-hook 'local-write-file-hooks
              '(lambda()
                 (save-excursion
                   (delete-trailing-whitespace))))))

;; jedi
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)                      ; optional
(setq jedi:complete-on-dot t)                 ; optional

;; ido
(require 'ido)
(ido-mode t)
