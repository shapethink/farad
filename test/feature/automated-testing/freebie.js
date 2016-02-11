module.exports = {
	"automated-testing": {
		"comes with free passing tests": {
			"(sync)": function() { return true; },
			"(callback)": function(done) { setTimeout(done, 10); },
			"(promise)": function() { return new Promise(
				function(pass, reject) {
					setTimeout(pass, 10);
			});}
		}
	}
}
