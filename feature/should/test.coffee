should = require "should"

module.exports =
	"edge cases for global should":
		".throw(->)":
			"when error is thrown":	->
				should.throw ->
					throw new Error "not foo"
			"when error is not thrown": ->
				should.throw ->
					should.throw ->
						new Error "not foo"
				, /assertion/i

		"throw(->, Error)":
			"when Error is thrown": ->
				should.throw ->
					throw new Error "not foo"
				, Error
