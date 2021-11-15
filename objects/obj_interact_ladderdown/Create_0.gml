/// @description 

// Inherit the parent event
event_inherited();

visible = true;

action = function() {
	audio_play_sound(snd_sound, 10, 0);
	x += 8;
	if (x >= 112) {
		visible = false;
		open = false;
		obj_ladderup.visible = true;
		obj_ladderup.open = true;
	}
}