fs = require "fs"
module.exports = (path) ->
	outer_path = path
	(path = outer_path) ->
		new Promise (resolve, reject) ->
			fs.unlink path, (err) ->
				reject err if err
				resolve()
