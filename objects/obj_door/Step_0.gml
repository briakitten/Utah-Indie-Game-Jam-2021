/// @description 

if (index != 2 && collision_rectangle(x - 1, y + 62, x + sprite_width + 2, y + 64, obj_player, 0, true)) {
	if (game.collectable_count >= threshold) {
		// open door
		instance_destroy(inst_collision);
		index = 2;
		audio_play_sound(snd_sound, 10, 0);
	} else if (index == 0) {
		index = 1;
	}
}

if (index == 1) {
	if (frame_timer.update()) {
		index = 0; // reset door animation
	}
}