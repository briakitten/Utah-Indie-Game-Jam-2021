/// @description 
event_inherited();

visible = false;
open = false;

action = function() {
	game.spawn_room = room1;
	game.player_active = false;
	instance_create_depth(0, 0, 0, transition_out)
	audio_sound_gain(snd_Birds, 0, 2000);
}