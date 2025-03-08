BINARY_NAME=datvoping
 	VERSION=$(shell git describe --tags --always --dirty)
 	LDFLAGS=-ldflags "-X main.version=${VERSION}"

 	.PHONY: all build clean run

 	all: build

 	build:
 		CGO_ENABLED=0 GOARCH=amd64 GOOS=darwin go build ${LDFLAGS} -o bin/${BINARY_NAME}-darwin main.go
 		CGO_ENABLED=0 GOARCH=amd64 GOOS=linux go build ${LDFLAGS} -o bin/${BINARY_NAME}-linux main.go
 		CGO_ENABLED=0 GOARCH=amd64 GOOS=windows go build ${LDFLAGS} -o bin/${BINARY_NAME}-windows.exe main.go
 		@echo "Build complete"

 	run: build
 		./bin/${BINARY_NAME}-darwin

 	clean:
 		go clean
 		rm -rf bin/