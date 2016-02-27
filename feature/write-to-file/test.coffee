chai = require "chai"
chai.use require "chai-as-promised"
should = chai.should()

removeFile = require "remove-file"

writeToFile = require __dirname

module.exports =
	"write-to-file":
		"nonexistent path components": ->
			p = Promise.resolve "Hello, World"
				.then writeToFile "/foo/bar"
				.should.be.rejectedWith "ENOENT"
		"existing path components": ->
			p = Promise.resolve "Hello, World"
				.then writeToFile "/tmp/bar"
				.then removeFile "/tmp/bar"
