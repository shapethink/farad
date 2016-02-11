module.exports = {
	"package.json": {
		should: {
			exist: function(done) {
				require("fs").exists("package.json",
					function(exists) {
						if(exists) { done(); }
						else { done(new Error("but it doesn't")); }
					}
				);
			}
		}
	}
}

