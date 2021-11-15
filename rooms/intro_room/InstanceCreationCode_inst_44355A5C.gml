action = function() {
	if (inst_food.empty) audio_play_sound(snd_sound, 10, false);
	else audio_play_sound(snd_munch, 10, false);
	
	if (inst_food.subimg < 6) inst_food.subimg++;
	else inst_food.empty = true;
}