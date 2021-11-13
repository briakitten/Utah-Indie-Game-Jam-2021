// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function increment_collectable(){
	game.collectable_count++;
	obj_player.max_speed *= 1.25;
	obj_player.acceleration += 0.02;
}