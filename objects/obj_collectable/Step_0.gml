/// @description 
if (place_meeting(x, y, par_player)) {
	increment_collectable();
	instance_destroy(self);
}