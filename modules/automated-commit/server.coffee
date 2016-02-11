chokidar = require "chokidar"

chokidar.watch "modules", persistent: true
	.on "addDir", console.log.bind console
