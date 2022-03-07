(require 'package)
(setq package-user-dir (expand-file-name "./.packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			  ("org" . "https://orgmode.org/elpa/")
			  ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(package-install 'ox-tufte)

;; load the publishing system
(require 'ox-publish)

(require 'ox-tufte)

;; Customize the html output
(setq org-html-validation-link nil
      org-html-head-include-scripts nil
      org-html-head-include-default-style nil
      ;;org-html-head "<link rel=\"stylesheet\" href=\"https://cdn.simplecss.org/simple-v1.css\" />")
      org-html-head "<link rel=\"stylesheet\" type \"text/css\" href=\"tufte.css\" />")

;; Define the publishing project
(setq org-publish-project-alist
      (list
       (list "diybiolab-org-site"
	     :html-container "section"
	     :html-doctype "html5"
	     :headline-levels 2
	     :html-html5-fancy t
	     :recursive t
	     :base-directory "./content"
	     :publishing-directory "./public"
	     :publishing-function 'org-html-publish-to-tufte-html
	     :with-author nil
	     :with-creator t
	     :with-toc nil
	     ;;:with-footnotes t
	     :section-numbers nil
	     :time-stamp-file nil)))

;; Generate the site output
(org-publish-all t)

(message "Build complete!")
