/// @description 

var buttonRight = keyboard_check(vk_right) || keyboard_check(ord("D"));
var buttonLeft = keyboard_check(vk_left) || keyboard_check(ord("A"));
var hInput = buttonRight - buttonLeft;

var leftBorder = 16;
var rightBorder = 160 - 32;

if (game.player_active) {

	if (hInput != 0) idle = false
	else idle = true;

	x += x_speed * hInput;
	if (x < leftBorder) x = leftBorder;
	if (x > rightBorder) x = rightBorder;
	
	if (hInput > 0) {
		xoffset = 0; xscale = 1;
	} else if (hInput < 0) {
		xoffset = 16; xscale = -1;
	}
}

if (idle) {
	frame_timer.threshold = 60;
} else {
	frame_timer.threshold = 30;
}