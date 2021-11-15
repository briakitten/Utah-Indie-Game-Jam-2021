/// @description 



if (frame_timer.update()) {
	xframe = 0;
} else {
	xframe = frame_timer.get_frame(2);
}

draw_sprite_part_ext(spr_creature, -1, xframe * frame_size, yframe * frame_size, frame_size, frame_size, 
	x + xoffset, y + yoffset, xscale, yscale, c_white, image_alpha);
	
if (game.interact_prompt) draw_sprite(spr_prompt, -1, x + 4, y - 8);

game.interact_prompt = false;