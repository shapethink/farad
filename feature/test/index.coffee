module.exports = class Test
	constructor: (@generator) ->
	check: (uut) => new Promise (fulfill, reject) =>
		@generator uut
			.then (status) -> fulfill uut
			.catch (error) -> reject error

Object.setProperty undefined, "foo",
	value: "bar"
