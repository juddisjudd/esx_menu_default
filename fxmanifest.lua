fx_version 'adamant'
game 'gta5'

author	'Judd#7644'
description 'ESX Menu Default Reskin'

version 'legacy'
lua54 'yes'
use_fxv2_oal 'yes'

client_scripts {
	'client/main.lua'
}

ui_page {
	'html/ui.html'
}

files {
	'html/ui.html',
	'html/css/app.css',
	'html/js/mustache.min.js',
	'html/js/app.js',
	'html/fonts/pdown.ttf',
	'html/fonts/bankgothic.ttf',
	'html/img/cursor.png',
	'html/img/keys/enter.png',
	'html/img/keys/return.png',
}

dependencies {
	'es_extended'
}
