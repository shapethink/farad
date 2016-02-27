module.exports = (delay) ->
	Promise.race [
		@
		new Promise (_, reject) -> setTimeout reject, delay
	]
