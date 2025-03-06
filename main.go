package main

import (
	"github.com/datvo2k/globalping-cli/cmd"
	pkgversion "github.com/datvo2k/globalping-cli/version"
)

var (
	// https://goreleaser.com/cookbooks/using-main.version/
	version = "dev"
)

func main() {
	pkgversion.Version = version
	cmd.Execute()
}
