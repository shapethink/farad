generateStubTest = require "generate-stub-test"
writeToFile = require "write-to-file"
git = require "git"

module.exports = (path) ->
	name = path.split("/").slice(1)
	branch = path

	console.log "Found new feature: #{name}"

	git "checkout", "-b", "next"
		.then -> generateStubTest name
		.then -> writeToFile "#{path}/test.js"
		.then -> git "add", path
		.then -> git "commit", "-m", "autocommit #{path}"
		.then -> git "checkout", "start", "-b", branch
		.then -> git "rebase", "--onto", branch, "develop", "next"
		.then -> git "checkout", branch
		.then -> git "merge", "next"
		.then -> git "branch", "-d", "next"
		.then -> git "checkout", "develop"
		.then -> git "merge", branch
		.then -> console.log "done!"
