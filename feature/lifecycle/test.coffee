module.exports =
	lifecycle:
		start:
			"should succeed": ->
				throw new Error "but it doesn't"
