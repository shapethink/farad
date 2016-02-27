Process = require "mz/child_process"
module.exports = (argv...) ->
	cmdline = argv.map (arg) -> "\"#{arg}\""
		.join " "
	new Promise (send, reject) ->
		Process.spawn "git", argv
			.on "error", (error) ->
				reject new Error "error launching: git #{cmdline}"
			.on "exit", (code, signal) ->
				if code is 0
					send code
				else
					message = "git #{cmdline} failed: #{code ? signal}"
					reject new Error message
