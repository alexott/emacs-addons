;;; sigdb-mode.el ---

;; Copyright (C) Alex Ott
;;
;; Author: Alex Ott <alexott@gmail.com>
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

;; (eval-when-compile (require 'cl))

(defvar sigdb-font-lock-keywords
  ;; The comment syntax can't be described simply in syntax-table.
  ;; We could use font-lock-syntactic-keywords, but is it worth it?
  '(("^;; .*" . font-lock-comment-face)
    ("\\_<\\(description\\|signatures\\|extensions\\|aliases\\|attributes\\)\\_>"
		 (1 font-lock-keyword-face))
		("attributes\\s *{\\(\\(stream\\|final\\|document\\|archive\\|image\\|video\\|audio\\|text\\|database\\|executable\\|\\s +\\)*\\)}"
		 1 font-lock-constant-face)
		("\\(\\\"[^\"]*\\\"\\)" 1 font-lock-string-face)
		("^\\(#include\\)\\s +\\\"[^\"]*\\\"" 1 font-lock-preprocessor-face)
		("^\\s *\\(\\S +/\\S +\\)" 1 font-lock-type-face)
		))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.sigdb\\'" . sigdb-mode))

;;;###autoload
(define-derived-mode sigdb-mode fundamental-mode "SigDB"
  "Major mode for signature database files."
  (set (make-local-variable 'font-lock-defaults)
       '(sigdb-font-lock-keywords t t nil nil))
  (set (make-local-variable 'comment-start) ";; ")
  (set (make-local-variable 'comment-end) "")
  (set (make-local-variable 'comment-end-skip) "[ 	]*\\(\\s>\\|\n\\)")
)

(provide 'sigdb-mode)

;;; sigdb-mode.el ends here
