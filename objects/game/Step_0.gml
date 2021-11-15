if (keyboard_check_pressed(vk_space) && room == gamestart) {
	audio_play_sound(snd_sound, 10, false);
	room_goto(intro_room);
}