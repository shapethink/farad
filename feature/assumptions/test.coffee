chai = require "chai"
chai.use require "chai-as-promised"
should = chai.should()

module.exports =
	beforeEach: -> @item = "value"
	javascript:
		"String":
			"#indexOf":
				"empty query": ->
					"test".indexOf("").should.equal 0
				"not found": ->
					"test".indexOf("foo").should.equal -1
				"match beginning": ->
					"xyz".indexOf("x").should.equal 0
				"match middle": ->
					"abcxyz".indexOf("x").should.equal 3
				"match end": ->
					"cbazyx".indexOf("x").should.equal 5
				"match all": ->
					"test".indexOf("test").should.equal 0

		"strict mode":
			"assignment to":
				before: ->
					@unextendable = {}
					Object.defineProperties @unextendable,
						unchangeable:
							value: "read-only"
							writeable: "false"
						unsettable:
							get: -> "getter-only"
					Object.preventExtensions @unextendable

				"read-only property": ->
					(-> @unextendable.unchangeable = "changed")
						.should.throw()

				"getter-only property": ->
					(-> @unextendable.unsettable = "changed")
						.should.throw()

				"new property on non-extensible object": ->
					(-> @unextendable.extension = "added")
						.should.throw()
