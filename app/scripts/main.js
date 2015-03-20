"use strict";

/* jshint devel:true */

(function(){
    var url = "stream/live.mpd";
    var context = new Dash.di.DashContext();
    var player = new MediaPlayer(context);
    player.startup();
    player.attachView(document.querySelector("#videoPlayer"));
    player.attachSource(url);
})();
