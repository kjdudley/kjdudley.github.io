(require 'package)
(setq package-user-dir (expand-file-name "./.packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			  ("org" . "https://orgmode.org/elpa/")
			  ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(package-install 'ox-tufte)
(package-install 'htmlize)

;; load the publishing system
(require 'ox-publish)

(require 'ox-tufte)

;; Customize the html output
(setq org-html-validation-link nil
      org-html-head-include-scripts nil
      org-html-head-include-default-style nil
      org-html-head "<link rel=\"stylesheet\" href=\"https://cdn.simplecss.org/simple-v1.css\" />")
      ;;org-html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"tufte.css\" />")

;; Define the publishing project
(setq org-publish-project-alist
      (list
       (list "org-content"
	     :recursive nil
	     :base-directory "./content"
	     :publishing-directory "./public"
	     :publishing-function 'org-html-publish-to-html
	     :with-author nil
	     :with-creator t
	     :with-toc t
	     ;;:with-footnotes t
	     :section-numbers nil
	     :time-stamp-file nil)
       (list "org-manuscripts"
	     :recursive t
	     :base-directory "./content/manuscripts"
	     :publishing-directory "./public/manuscripts"
	     :publishing-function 'org-html-publish-to-tufte-html
	     :with-author nil
	     :with-creator t
	     :with-toc nil
	     ;;:with-footnotes t
	     :section-numbers nil
	     :time-stamp-file nil)
       ))

;; Generate the site output
(org-publish-all t)

(message "Build complete!")
