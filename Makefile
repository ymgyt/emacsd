.PHONY: init
init: init-go

.PHONY: init-go
init-go:
	go get -u github.com/nsf/gocode
	go get -u github.com/rogpeppe/godef 
	go get -u github.com/golang/lint/golint
	go get -u github.com/kisielk/errcheck
