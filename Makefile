BINARY_NAME ?= gogh
OUT_DIR ?= dist
VERSION ?= dev
LDFLAGS = -s -w -X 'main.version=$(VERSION)'

.PHONY: build build-linux build-macos release clean

build:
	go build -trimpath -ldflags="$(LDFLAGS)" -o $(OUT_DIR)/$(BINARY_NAME) ./cmd/gogh

build-linux:
	GOOS=linux GOARCH=amd64 go build -trimpath -ldflags="$(LDFLAGS)" -o $(OUT_DIR)/$(BINARY_NAME)-linux-amd64 ./cmd/gogh
	GOOS=linux GOARCH=arm64 go build -trimpath -ldflags="$(LDFLAGS)" -o $(OUT_DIR)/$(BINARY_NAME)-linux-arm64 ./cmd/gogh

build-macos:
	GOOS=darwin GOARCH=amd64 go build -trimpath -ldflags="$(LDFLAGS)" -o $(OUT_DIR)/$(BINARY_NAME)-darwin-amd64 ./cmd/gogh
	GOOS=darwin GOARCH=arm64 go build -trimpath -ldflags="$(LDFLAGS)" -o $(OUT_DIR)/$(BINARY_NAME)-darwin-arm64 ./cmd/gogh

release: build-linux build-macos

clean:
	rm -rf $(OUT_DIR)
