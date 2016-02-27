should = require "should"
Promise = require "promise"
Promise.delay = require "promise-delay"
sinon = require "sinon"
{test: delay: {natural, faster, slower}} = require "config"

module.exports =
	"a pending promise":
		beforeEach: -> @spy = sinon.spy()
		"should not invoke then callback until resolved": ->
			resolveSpy = sinon.spy()
			Promise.all [
				Promise.delay(natural).then resolveSpy
				Promise.delay(faster).then ->
					resolveSpy.should.not.be.called
				Promise.delay(slower).then ->
					resolveSpy.should.be.calledOnce
			]
