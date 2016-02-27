file_exists = require __dirname
module.exports =
	"file-exists":
		"should yield true for an existing file": ->
			file_exists "/etc/passwd"
				.then (exists) ->
					if exists then Promise.resolve()
					else Promise.reject new Error "but it yields false"
		"should yield false for a file that doesn't exist": ->
			file_exists "/does/not/exist"
				.then (exists) ->
					unless exists then Promise.resolve()
					else Promise.reject new Error "but it yields true"
