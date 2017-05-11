 #==================================================
#	GUI
#==================================================
var load_gui = func {
	var dialogs   = ["brfgpassengers"];
	var filenames = ["announcements-dialog"];

	forindex (var i; dialogs)
		gui.Dialog.new("/sim/gui/dialogs/" ~ dialogs[i] ~ "/dialog", "Nasal/br_fgpassengers/dialogs/" ~ filenames[i] ~ ".xml");

	var data = {
		label   : "-- Anuncios --",
		enabled : "false",
		name    : "noname",
		binding : { command : "dialog-show", "dialog-name" : "noname" }
	};

	props.globals.getNode("/sim/menubar/default/menu[5]").addChild("item").setValues(data);
	
	var data = {
		label   : "BRFGPassengers (v01)",
		name    : "brfgpassengers",
		binding : { command : "dialog-show", "dialog-name" : "brfgpassengers" }
	};

	props.globals.getNode("/sim/menubar/default/menu[5]").addChild("item").setValues(data);

	fgcommand("gui-redraw");
}

print("BR FG Passengers GUI loaded");