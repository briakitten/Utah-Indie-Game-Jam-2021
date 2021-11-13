/// @description 

xframe = 0;
yframe = 0;
xscale = 1;
yscale = 1;
xoffset = 0;
yoffset = 0;

switch (dir8) {
	case Dir8.DOWN_RIGHT:
	case Dir8.DOWN:
		
		break;
	case Dir8.DOWN_LEFT:
	case Dir8.LEFT:
		xscale = -1; xoffset = 32;
		break;
	case Dir8.UP_LEFT:
	case Dir8.UP:
		xscale = -1; xoffset = 32;
		yframe = 1;
		break;
	case Dir8.UP_RIGHT:
	case Dir8.RIGHT:
		yframe = 1;
		break;
}

if (frame_timer.update()) {
	xframe = 0;
} else {
	xframe = frame_timer.get_frame(4);
}

draw_sprite_part_ext(spr_player_spritesheet, -1, xframe * frame_size, yframe * frame_size, frame_size, frame_size, 
	x + xoffset, y + yoffset, xscale, yscale, c_white, image_alpha);

//draw_self();