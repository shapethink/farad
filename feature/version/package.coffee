module.exports =
	name: "version"
	scripts:
		test: "echo 'A test!'"

module.exec = (argv, env) ->
	console.log argv.join " "

if module is require?.main
	module.exec process.argv.slice(2), process.env
