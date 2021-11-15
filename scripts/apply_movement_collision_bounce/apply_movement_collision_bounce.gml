/// @function apply_movement_collision_bounce(_spd, _dir)
/// @param _spd
/// @param _dir
function apply_movement_collision_bounce(_spd, _dir) {
	var spd = _spd;
	var dir = _dir;
	var step_incremented_spd = 0;
	var step_spd = 0;
	var step_size = 6;
	
	//var return_angle = undefined;
	
	while(step_incremented_spd < spd) { // increment for xtarg and ytarg
		step_spd = step_size;
		step_incremented_spd += step_spd; 
		if (step_incremented_spd > spd) {
			step_spd = spd - (step_incremented_spd - step_size)
			step_incremented_spd = spd; 
		} // finish initializing increment variables
		
		var xtarg = x+lengthdir_x(step_spd,dir);
		var ytarg = y+lengthdir_y(step_spd,dir);
		var xprev = x;
		var yprev = y;
		x = xtarg;
		y = ytarg;
 
		// TODO new collision looking at bouncing against collision objects
		
		//var _width = sprite_width;
		//var _height = sprite_height;
		//var xtargcenter = xtarg + sprite_width / 2;
		//var ytargcenter = ytarg + sprite_height / 2;
		//var xtargspd = xtargcenter
		
		var inst = instance_place(x, y, par_collision);
		if (instance_exists(inst)) { // collides, find trajectory
			var instx2 = inst.x + inst.sprite_width;
			var insty2 = inst.y + inst.sprite_height;
			var xnorm = lengthdir_x(1, _dir); 
			var ynorm = lengthdir_y(1, _dir);
			
			// top side collision (with distance approximations for more accurate corner bounces)
			//var checkinst = collision_line(inst.x, inst.y, instx2, inst.y, self, 0, 0);
			if (collision_line(inst.x, inst.y, instx2, inst.y, self, 0, 0) != noone && y <= inst.y + inst.sprite_height / 4) {
				ynorm *= -1;
			} // right side collision
			if (collision_line(instx2, inst.y, instx2, insty2, self, 0, 0) != noone && x >= instx2 - inst.sprite_width * 0.75) {
				xnorm *= -1;
			} // bottom side collision
			if (collision_line(inst.x, insty2, instx2, insty2, self, 0, 0) != noone && y >= insty2 - inst.sprite_height * 0.75) {
				ynorm *= -1;
			} // left side collision
			if (collision_line(inst.x, inst.y, inst.x, insty2, self, 0, 0) != noone && x <= inst.x + inst.sprite_width / 4) {
				xnorm *= -1;
			}
			
			x = xprev;
			y = yprev;
			entity_dir = point_direction(0, 0, xnorm, ynorm); // uses the normal of the bounced surfaces
			return true;
		}
		
		x = xtarg;
		y = ytarg;
	}
	
	return false;
}
