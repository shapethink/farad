var fs = require("fs");
module.exports = {
	"config": {
		"should exist": function(done) {
			fs.exists(require.resolve("config"),
				function(exists) {
					if(exists) { done(); }
					else { done(new Error("but it doesn't")); }
				}
			);
		}
	}
};
