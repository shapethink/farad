Promise = require "promise"
Promise.delay = require "promise-delay"
{test: delay: {natural, slower, faster}} = require "config"

Promise.prototype.timeout = require __dirname

module.exports =
	"Promise#timeout":
		"should reject if the promise is slower": ->
			Promise.delay(slower).timeout(natural)
				.should.eventually.be.rejected
		"should resolve if the promise is faster": ->
			Promise.delay(faster).timeout(natural)
