"use strict";

/* jshint devel:true */

(function(){
    var url = "http://54.201.151.65/livesim/tfdt_32/testpic_2s/Manifest.mpd";
    var context = new Dash.di.DashContext();
    var player = new MediaPlayer(context);
    player.startup();
    player.attachView(document.querySelector("#videoPlayer"));
    player.attachSource(url);
})();
