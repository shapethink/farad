remove_file = require __dirname
write_to_file = require "write-to-file"

module.exports =
	remove_file:
		"should succeed if the file exists": ->
