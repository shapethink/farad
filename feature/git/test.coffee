module.exports =
	git:
		"should not fail": ->
			git = require "."
			git "branch", "temp-for-test"
				.then -> git "branch", "-d", "temp-for-test"
