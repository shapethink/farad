chai = require "chai"
chai.use require "chai-as-promised"
should = chai.should()

Test = require __dirname

module.exports =
	test:
		"object oriented test": ->
			t = new Test (text) -> Promise.resolve ->
				text.should.be.a "string", "but it isn't"

			Promise.resolve "foo"
				.then t.check
