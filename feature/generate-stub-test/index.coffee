module.exports = (name) -> Promise.resolve """
	module.exports = {
		"#{name}": {
			"should have tests": function(){
				throw new Error("but it has none");
			}
		}
	}
"""
