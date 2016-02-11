Process = require "child_process"
git = (argv...) ->
	console.log "git", argv
	new Promise (send, reject) ->
		Process.spawn "git", argv
			.on "exit", (code, signal) ->
				if code is 0 then send code
				else reject new Error "git #{arguments} failed: #{code ? signal}"

fs = require "fs"
writeStubTest = (path, name) ->
	console.log "write stub test"
	new Promise (send, reject) ->
		fs.writeFile "#{path}/test.js", """
			module.exports = {
				"#{name}": {
					"needs some tests": {}
				}
			}
		""", (err) ->
			if err then reject err else send()

chokidar = require "chokidar"
watcher = chokidar.watch "modules",
	persistent: true
	ignoreInitial: true

watcher
	.on "ready", -> console.log "ready."
	.on "addDir", (path) ->
		name = path.split("/").slice(1)
		branch = name

		console.log "Found new module: #{name}"

		git "checkout", "-b", "next"
			.then writeStubTest path, name
			.then git "add", path
			.then git "commit", "-am", "autocommit"
			.then git "stash"
			.then git "checkout", "start", "-b", branch
			.then git "rebase", "--onto", branch, "develop", "next"
			.then git "checkout", branch
			.then git "merge", "next"
			.then git "branch", "-d", "next"
			.then git "checkout", "develop"
			.then git "merge", branch
			.then -> console.log "done!"
