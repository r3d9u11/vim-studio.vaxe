package;

import sys.io.Process;
import systools.Dialogs;

using StringTools;

class Main {
	public static function main () {
		var deps:Array<String> = ([
			"lime",
			"openfl",
			"stablexui"
		]).map(function (depTitle) return depTitle.toLowerCase());
		
		for (lib in (new Process("haxelib", ["list"]).stdout.readAll().toString().split("\n")))
			if (deps.length > 0)
				deps.remove(lib.split(":")[0].trim().toLowerCase());
		
		if (deps.length > 0) {
			Dialogs.message("Template Initialization Error",'Unsatisfied dependencies:\n\n${deps.join("\n")}', true);
			Sys.stdout().writeString("0");
		}
		else
			Sys.stdout().writeString("1");
	}
}
