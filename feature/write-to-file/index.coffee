fs = require "fs"
module.exports = (path) -> (content) ->
	new Promise (resolve, reject) ->
		fs.writeFile path, content, (err) ->
			reject err if err
			resolve()
