should = require "should"

class RejectAll extends Error
	constructor: (@message, @rejections) ->

module.exports = (promises) ->
	should.exist promises
	promises.should.be.an "array"
	promise.should.be.a "promise" for promise in promises

	promiseCount = promises.length
	rejectionCount = 0
	rejections = {}

	new Promise (resolveOne, rejectAll) ->
		rejectAll [] if promiseCount < 1
		resolveAny = (promise) ->
			promise.then (result) ->
				resolveOne result
			.catch (reason) ->
				rejectionCount += 1
				rejections[promise] = reason
				rejectAll rejections if rejectionCount == promiseCount

		resolveAny promise for promise in promises
