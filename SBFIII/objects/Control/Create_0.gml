background_color = c_aqua
var i;
for (i = 0; i < instance_number(Player); i += 1)
   {
   players[i] = instance_find(Player,i);
   }
global.mute=true

paused = false;
screenShot = -1;

//play music
if (not global.mute and not audio_is_playing(themeSong_sf)){
	audio_play_sound(themeSong_sf,.5,1)
}
depth=0
mb = noone//menu button