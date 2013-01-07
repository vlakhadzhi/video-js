//
_V_.PopupButton = _V_.Button.extend({
init: function(player, options) {
	this._super(player, options);
	if(!player.textTracks.length || player.options.popup.hide) this.hide();
},

buttonText: "popup",

buildCSSClass: function(){
	return "vjs-popup-control " + this._super();
},

onClick: function(){
	var self = this;

        if(!this.player.textTracks.length) return;
        if(this.player.textTracks[0].readyState != 2) {
		this.player.textTracks[0].load()
	}

	(function() {
		var i = 0, itv = setInterval(function() {
			if(i > 50 || self.player.textTracks[0].readyState == 2) {
				create_popup();
				clearInterval(itv);
			}
			i++;
		}, 200);
	})();

	function create_popup() {
		win = open("","_search", "scrollbars=1,resizable=1,left=0,top=0,height=250,width=" + screen.width/2);

		if(!this.popup_html) {
			this.popup_html =
			'<!doctype html><html><head>' +
				'<title>Subtitles</title>' +
				'<meta charset="utf-8">' +
			'</head>' +
				'<body style="font-size:10pt;font-family:Arial,sans-serif">' +
					'<ul style="padding-left:20px;margin:0">';

			for(var i in self.player.textTracks[0].cues) {
				this.popup_html += "<li>" + self.player.textTracks[0].cues[i].text;
			}

			this.popup_html += "</ul></body></html>";
		}

		win.document.writeln(this.popup_html);
		win.document.close();
		win.focus();
	}
  }
});

_V_.merge(_V_.ControlBar.prototype.options.components, {
	"popupButton": {}
});
//
