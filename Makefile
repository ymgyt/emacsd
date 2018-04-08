.PHONY: init
init: init-go

.PHONY: init-go
init-go:
	go get  github.com/nsf/gocode
	go get  github.com/rogpeppe/godef 
	go get  github.com/golang/lint/golint
	go get  github.com/kisielk/errcheck
	go get  golang.org/x/tools/cmd/goimports
	go get  gopkg.in/alecthomas/gometalinter.v2
	gometalinter --install

.PHONY: clear
clean:
	rm -rf elpa/*

.PHONY: readme
readme:
	echo "M-x all-the-icons-install-fonts"
