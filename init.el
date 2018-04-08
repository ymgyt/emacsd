
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/init.d")

(require 'init-packages)
(require 'init-face)
(require 'init-keybind)
(require 'init-snippet)
(require 'init-etc)
