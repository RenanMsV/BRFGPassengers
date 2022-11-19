#   https://sourceforge.net/p/flightgear/fgdata/ci/next/tree/Docs/README.add-ons

var main = func(addon) {

  # Creating BRFGPassengersAudioClass that handles the listener
  #   var class = BRFGPassengersAudioClass.new(_propname, _audiofilename);

  #   if needed to play can call at any time,
  #   but the listener takes care of it by itself when using the dialog
  #   class.playsound();

  var BRFGPassengersAudioClass = {
    new: func(_propname, _audiofilename) {
        var m = { parents: [BRFGPassengersAudioClass] };
        m.propname = "/addons/by-id/github.renanmsv.addons.BRFGPassengers/sounds/" ~ _propname;
        m.audiofilename = _audiofilename;
        setlistener(m.propname, func {
          if(!getprop(m.propname)) return;
          m.playsound();
        });
        return m;
    },
    playsound: func {
      logprint(LOG_INFO, "[BRFGPassengers-Addon] Playing sound: ", "\"/sounds/"~ me.audiofilename ~ "\"");
      var hash = {
        path   : "[addon=github.renanmsv.addons.BRFGPassengers]sounds",
        file   : me.audiofilename,
        volume : 1.0
      };
      fgcommand ("play-audio-sample", props.Node.new(hash));
      hash = nil;
    },
  };
  #--------------------------------------------------

  # full list of audios and their properties. must be the same properties of the dialog.
  var audio_list = [
    # { property-name, audio-file-name },
    { propname: "cabinalert", audiofilename: "crew_cabinalert.wav" },
    { propname: "welcome", audiofilename: "crew_welcomeonboard.wav" },
    { propname: "safety", audiofilename: "crew_safetyaboard.wav" },
    { propname: "prepareto", audiofilename: "crew_preparetakeoff.wav" },
    { propname: "climbimg", audiofilename: "crew_climbingdevice.wav" },
    { propname: "beforeturb", audiofilename: "crew_beforeturbulence.wav" },
    { propname: "turb", audiofilename: "crew_turbulence.wav" },
    { propname: "boardservice", audiofilename: "crew_servesandwich.wav" },
    { propname: "prepareld", audiofilename: "crew_beforeland.wav" },
    { propname: "afterld", audiofilename: "crew_aftland.wav" }
  ];

  foreach(audio; audio_list) {
    var class = BRFGPassengersAudioClass.new(audio.propname, audio.audiofilename);
  }

  logprint(LOG_INFO, "[BRFGPassengers-Addon] Initialized from path ", addon.basePath);
}
