generateStubTest = require __dirname
module.exports =
	"generate-stub-test":
		"should generate a stub test": ->
			name = "generateStubTest"
			generateStubTest name
				.then (text) ->
					notFound = -1
					if text.indexOf(name) is notFound
						Promise.reject new Error "name not present in stub"
					else Promise.resolve()
