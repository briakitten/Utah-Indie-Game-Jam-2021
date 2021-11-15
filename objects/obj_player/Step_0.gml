/// @description 

var buttonRight = keyboard_check(vk_right) || keyboard_check(ord("D"));
var buttonLeft = keyboard_check(vk_left) || keyboard_check(ord("A"));
var buttonUp = keyboard_check(vk_up) || keyboard_check(ord("W"));
var buttonDown = keyboard_check(vk_down) || keyboard_check(ord("S"));
var hInput = buttonRight - buttonLeft;
var vInput = buttonDown - buttonUp;

x_speed += hInput * acceleration;
y_speed += vInput * acceleration;

entity_speed = sqrt(x_speed * x_speed + y_speed * y_speed)
entity_dir = point_direction(0, 0, x_speed, y_speed);

// check for max speed threshold
if (entity_speed > max_speed) {
	entity_speed = max_speed;
	x_speed = lengthdir_x(max_speed, entity_dir);
	y_speed = lengthdir_y(max_speed, entity_dir);
	entity_dir = point_direction(0, 0, x_speed, y_speed);
}

apply_movement_collision_bounce(entity_speed, entity_dir);

if (entity_dir != point_direction(0, 0, x_speed, y_speed)) {
	// bonk or crash sound depending on speed
	if (entity_speed < 3) {
		var snd_index = audio_play_sound(snd_cartBonk, 100, 0);
		audio_sound_gain(snd_index, random_range(0.2, 0.67), 0);
		audio_sound_pitch(snd_index, random_range(0.8, 1.2));
	} else {
		var snd_index = audio_play_sound(snd_cartCrash, 100, 0);
		audio_sound_gain(snd_index, random_range(0.5, 1), 0);
		audio_sound_pitch(snd_index, random_range(0.8, 1.2));
	}
	
	x_speed = lengthdir_x(entity_speed * 0.75, entity_dir);
	y_speed = lengthdir_y(entity_speed * 0.75, entity_dir);
}

// cart movement sound
if (entity_speed >= 0.5 && entity_speed < 3) {
	if (!audio_is_playing(snd_cart)) {
		audio_play_sound(snd_cart, 100, 1);
	} 
	audio_sound_gain(snd_cart, 0.33, 0);
	audio_sound_pitch(snd_cart, 0.9);
} else if (entity_speed >= 3) {
	if (!audio_is_playing(snd_cart)) {
		audio_play_sound(snd_cart, 100, 1);
	}
	audio_sound_gain(snd_cart, 0.67, 0);
	audio_sound_pitch(snd_cart, 1);
} else {
	audio_stop_sound(snd_cart);
}

dir8 = floor(entity_dir / 45);

// camera behavior
if (camera_follow) {
	var cw = 320;
	var ch = 240;
	var width_offset = - (cw / 2 - 16);
	var height_offset = - (ch / 2 - 16);
	var cx = x + width_offset;
	var cy = y + height_offset;
	
	if (cx < 0) {
		cx = 0;
	} 
	if (cy < 0) {
		cy = 0;
	}
	if (cx > room_width - cw) {
		cx = room_width - cw;
	}
	if (cy > room_height - ch) {
		cy = room_height - ch;
	}
	
	camera_set_view_pos(view_camera[0], cx, cy);
	
}

// check for player finish
if (y < 0) {
	game.player_active = false;
	game.spawn_room = end_screen;
	instance_create_layer(0, 0, "Instances", transition_out);
}