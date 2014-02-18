((ac-python status "removed" recipe nil)
 (auto-complete status "installed" recipe
                (:name auto-complete :website "http://cx4a.org/software/auto-complete/" :description "The most intelligent auto-completion extension." :type github :pkgname "m2ym/auto-complete" :depends
                       (popup fuzzy)))
 (ctable status "installed" recipe
         (:name ctable :description "Table Component for elisp" :type github :pkgname "kiwanami/emacs-ctable"))
 (deferred status "installed" recipe
   (:name deferred :description "Simple asynchronous functions for emacs lisp" :website "https://github.com/kiwanami/emacs-deferred" :type github :pkgname "kiwanami/emacs-deferred" :features "deferred"))
 (el-get status "installed" recipe
         (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "4.stable" :pkgname "dimitri/el-get" :features el-get :info "." :load "el-get.el"))
 (epc status "installed" recipe
      (:name epc :description "An RPC stack for Emacs Lisp" :type github :pkgname "kiwanami/emacs-epc" :depends
             (deferred ctable)))
 (feature-mode status "installed" recipe
               (:name feature-mode :description "Major mode for Cucumber feature files" :type github :pkgname "michaelklishin/cucumber.el" :features feature-mode :post-init
                      (add-to-list 'auto-mode-alist
                                   '("\\.feature\\'" . feature-mode))))
 (flymake-cursor status "installed" recipe
                 (:name flymake-cursor :auto-generated t :type emacswiki :description "displays flymake error msg in minibuffer after delay" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/flymake-cursor.el"))
 (fuzzy status "installed" recipe
        (:name fuzzy :website "https://github.com/m2ym/fuzzy-el" :description "Fuzzy matching utilities for GNU Emacs" :type github :pkgname "m2ym/fuzzy-el"))
 (highlight status "installed" recipe
            (:name highlight :auto-generated t :type emacswiki :description "Highlighting commands." :website "https://raw.github.com/emacsmirror/emacswiki.org/master/highlight.el"))
 (highlight-chars status "installed" recipe
                  (:name highlight-chars :auto-generated t :type emacswiki :description "Highlight specified sets of characters, including whitespace." :website "https://raw.github.com/emacsmirror/emacswiki.org/master/highlight-chars.el"))
 (ido-preview status "installed" recipe
              (:name ido-preview :auto-generated t :type emacswiki :description "commands for viewing current option contests before opening" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/ido-preview.el"))
 (jedi status "installed" recipe
       (:name jedi :description "An awesome Python auto-completion for Emacs" :type github :pkgname "tkf/emacs-jedi" :build
              (("make" "requirements"))
              :depends
              (epc auto-complete)))
 (magit status "installed" recipe
        (:name magit :website "https://github.com/magit/magit#readme" :description "It's Magit! An Emacs mode for Git." :type github :pkgname "magit/magit" :info "." :autoloads
               ("50magit")
               :build
               (("make" "all"))
               :build/darwin
               `(,(concat "make EMACS=" el-get-emacs " all"))))
 (multiple-cursors status "installed" recipe
                   (:name multiple-cursors :description "An experiment in adding multiple cursors to emacs" :type github :pkgname "magnars/multiple-cursors.el" :features multiple-cursors))
 (popup status "installed" recipe
        (:name popup :website "https://github.com/m2ym/popup-el" :description "Visual Popup Interface Library for Emacs" :type github :pkgname "m2ym/popup-el"))
 (pymacs status "installed" recipe
         (:name pymacs :description "Interface between Emacs Lisp and Python" :type github :pkgname "pinard/Pymacs" :prepare
                (progn
                  (el-get-envpath-prepend "PYTHONPATH" default-directory)
                  (autoload 'pymacs-load "pymacs" nil t)
                  (autoload 'pymacs-eval "pymacs" nil t)
                  (autoload 'pymacs-exec "pymacs" nil t)
                  (autoload 'pymacs-call "pymacs")
                  (autoload 'pymacs-apply "pymacs"))
                :build
                ("make")))
 (rope status "installed" recipe
       (:name rope :description "A python refactoring library" :post-init
              (el-get-envpath-prepend "PYTHONPATH" default-directory)
              :type hg :url "http://bitbucket.org/agr/rope"))
 (ropemacs status "installed" recipe
           (:name ropemacs :description "An Emacs minor mode for using rope python refactoring library in emacs." :post-init
                  (progn
                    (unless
                        (boundp 'pymacs-load-path)
                      (setq pymacs-load-path nil))
                    (add-to-list 'pymacs-load-path default-directory))
                  :depends
                  (rope ropemode)
                  :type hg :url "http://bitbucket.org/agr/ropemacs"))
 (ropemode status "installed" recipe
           (:name ropemode :description "Common parts of ropemacs and ropevim." :post-init
                  (progn
                    (unless
                        (boundp 'pymacs-load-path)
                      (setq pymacs-load-path nil))
                    (add-to-list 'pymacs-load-path default-directory))
                  :type hg :url "http://bitbucket.org/agr/ropemode"))
 (swank-js status "removed" recipe nil)
 (vcl-mode status "removed" recipe nil)
 (visws status "installed" recipe
        (:name visws :auto-generated t :type emacswiki :description "Make whitespace visible    -*- coding: latin-1 -*-" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/visws.el"))
 (whitespace status "installed" recipe
             (:name whitespace :auto-generated t :type emacswiki :description "minor mode to visualize TAB, (HARD) SPACE, NEWLINE" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/whitespace.el"))
 (yasnippet status "installed" recipe
            (:name yasnippet :website "https://github.com/capitaomorte/yasnippet.git" :description "YASnippet is a template system for Emacs." :type github :pkgname "capitaomorte/yasnippet" :features "yasnippet" :pre-init
                   (unless
                       (or
                        (boundp 'yas/snippet-dirs)
                        (get 'yas/snippet-dirs 'customized-value))
                     (setq yas/snippet-dirs
                           (list
                            (concat el-get-dir
                                    (file-name-as-directory "yasnippet")
                                    "snippets"))))
                   :post-init
                   (put 'yas/snippet-dirs 'standard-value
                        (list
                         (list 'quote
                               (list
                                (concat el-get-dir
                                        (file-name-as-directory "yasnippet")
                                        "snippets")))))
                   :compile nil :submodule nil))
 (yasnippet-config status "installed" recipe
                   (:name yasnippet-config :auto-generated t :type emacswiki :description "Configuration of yasnippet.el" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/yasnippet-config.el")))
