#==================================================

#--------------------------------------------------
var play_sound = func (v) {
	var hash = {
		path   : getprop("/sim/fg-root") ~ "/Nasal/br_fgpassengers/sounds",
		file   : v,
		volume : 1.0
	};
	fgcommand ("play-audio-sample", props.Node.new(hash));
}

#fgcommand("play-audio-sample", Sound.new(filename: 'blade_vortex.wav', volume: 0.8) );

#==================================================
#	Start
#==================================================

var load_nasal = func (v) {
	var path = getprop("/sim/fg-root");
	foreach (var script; v)
		io.load_nasal ( path ~ "/Nasal/br_fgpassengers/" ~ script ~ ".nas", "brfgpassengers" );
}
#--------------------------------------------------
var fdm_init_listener = _setlistener("/sim/signals/fdm-initialized", func {
	removelistener(fdm_init_listener);

	#load_nasal ([
	#	"gui",
	#]);

	load_gui();
});

props.globals.getNode("/sim/sound/chatter/enabled").setValue(1);
props.globals.getNode("/sim/sound/chatter/volume").setValue(1.0);

setlistener("/sim/sound/brfgpassengers/cabinalert", func {
	if(!getprop("/sim/sound/brfgpassengers/cabinalert")) return;
	play_sound("crew_cabinalert.wav");
});
setlistener("/sim/sound/brfgpassengers/welcome", func {
	if(!getprop("/sim/sound/brfgpassengers/welcome")) return;
	play_sound("crew1_welcomeonboard.wav");
});
setlistener("/sim/sound/brfgpassengers/safety", func {
	if(!getprop("/sim/sound/brfgpassengers/safety")) return;
	play_sound("crew2_safetyaboard.wav");
});
setlistener("/sim/sound/brfgpassengers/prepareto", func {
	if(!getprop("/sim/sound/brfgpassengers/prepareto")) return;
	play_sound("crew_preparetakeoff.wav");
});
setlistener("/sim/sound/brfgpassengers/climbimg", func {
	if(!getprop("/sim/sound/brfgpassengers/climbimg")) return;
	play_sound("crew3_climbingdevice.wav");
});
setlistener("/sim/sound/brfgpassengers/beforeturb", func {
	if(!getprop("/sim/sound/brfgpassengers/beforeturb")) return;
	play_sound("crew_beforeturbulence.wav");
});
setlistener("/sim/sound/brfgpassengers/turb", func {
	if(!getprop("/sim/sound/brfgpassengers/turb")) return;
	play_sound("crew_turbulence.wav");
});
setlistener("/sim/sound/brfgpassengers/boardservice", func {
	if(!getprop("/sim/sound/brfgpassengers/boardservice")) return;
	play_sound("crew_servesandwich.wav");
});
setlistener("/sim/sound/brfgpassengers/prepareld", func {
	if(!getprop("/sim/sound/brfgpassengers/prepareld")) return;
	play_sound("crew_beforeland.wav");
});
setlistener("/sim/sound/brfgpassengers/afterld", func {
	if(!getprop("/sim/sound/brfgpassengers/afterld")) return;
	play_sound("crew8_aftland.wav");
});
#var reinit_listener = setlistener("/sim/signals/reinit", func {
#	fgcommand("gui-redraw");
#});
#eof