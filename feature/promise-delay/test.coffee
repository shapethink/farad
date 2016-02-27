should = require "should"

Promise.delay = require __dirname
{test: delay: {slower, faster}} = require "config"

module.exports =
	"Promise.delay":
		"should not be slower than setTimeout": ->
			Promise.race [
				Promise.delay faster
				new Promise (x, reject) -> setTimeout reject, slower
			]
		"should not be faster than setTimeout": ->
			Promise.race [
				Promise.delay(slower).then -> Promise.reject()
				new Promise (resolve) -> setTimeout resolve, faster
			]
		"should not be slower than itself": ->
			Promise.race [
				Promise.delay faster
				Promise.delay(slower).then -> Promise.reject()
			]
