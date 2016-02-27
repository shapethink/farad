should = require "should"
Promise.any = require __dirname
Promise.delay = require "promise-delay"
{test: delay:{slower, natural, faster}} = require "config"

module.exports =
	"Promise.any":
		"should resolve if given any resolving promises":
			"(start)": ->
				Promise.any [
					Promise.resolve()
					Promise.reject()
					Promise.reject()
				]
			"(middle)": ->
				Promise.any [
					Promise.reject()
					Promise.resolve()
					Promise.reject()
				]
			"(end)": ->
				Promise.any [
					Promise.reject()
					Promise.reject()
					Promise.resolve()
				]
			"(all)": ->
				Promise.any [
					Promise.resolve()
					Promise.resolve()
					Promise.resolve()
				]
			"(only)": ->
				Promise.any [
					Promise.resolve()
				]

		"should reject if given only rejecting promises":
			"(none)": ->
				Promise.any([]).should.eventually.be.rejected
			"(one)": ->
				Promise.any([Promise.reject()])
					.should.eventually.be.rejected
			"(many)": ->
				Promise.any [
					Promise.reject()
					Promise.reject()
					Promise.reject()
				]
					.should.eventually.be.rejected

		"should throw if given no arguments": ->
			fn = -> Promise.any()
			fn.should.throw()

		"should throw if given a non-array": ->
			fn = -> Promise.any("non-array")
			fn.should.throw()

		"should throw if given any non-promises":
			"(start)": ->
				fn = -> Promise.any [
					"non-promise"
					Promise.resolve()
					Promise.reject()
				]
				fn.should.throw()
			"(middle)": ->
				fn = -> Promise.any [
					Promise.resolve()
					"non-promise"
					Promise.reject()
				]
				fn.should.throw()
			"(end)": ->
				fn = -> Promise.any [
					Promise.resolve()
					Promise.reject()
					"non-promise"
				]
				fn.should.throw()
			"(all)": ->
				fn = -> Promise.any [
					"non-promise"
					"non-promise"
					"non-promise"
				]
				fn.should.throw()
			"(only)": ->
				fn = -> Promise.any [
					"non-promise"
				]
				fn.should.throw()

		"should resolve as soon as any promise resolves": ->
			Promise.race [
				Promise.any [
					Promise.delay faster
					Promise.delay slower
				]
				Promise.delay(natural).then ->
					new Promise (_, reject) -> reject()
			]
