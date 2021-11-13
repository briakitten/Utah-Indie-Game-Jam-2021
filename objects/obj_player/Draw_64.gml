/// @description 

if (game.collectable_count > 0) {
	draw_sprite_stretched(spr_collectable, -1, 48, 16, 64, 64);
	draw_set_font(fnt_creature);
	draw_text_transformed(128, 32, game.collectable_count, 2, 2, 0);
}