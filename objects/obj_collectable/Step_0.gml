/// @description 
if (place_meeting(x, y, par_player)) {
	increment_collectable();
	audio_play_sound(snd_munch, 100, 0);
	instance_destroy(self);
}