fs = require "fs"
chokidar = require "chokidar"

watcher = chokidar.watch process.env.NODE_DIR,
	persistent: true
	ignoreInitial: true

initFeature = require "./init-feature"

watcher
	.on "ready", ->
		watcher.on "addDir", initFeature
		console.log "ready."
