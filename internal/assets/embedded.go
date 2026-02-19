package assets

import "embed"

// embeddedFiles contains all offline Gogh runtime assets.
//
//go:embed files/**
var embeddedFiles embed.FS
