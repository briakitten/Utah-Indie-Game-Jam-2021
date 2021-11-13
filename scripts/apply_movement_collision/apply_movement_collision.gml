/// @function apply_movement_collision(_spd, _dir)
/// @param _spd
/// @param _dir
function apply_movement_collision(_spd, _dir) {
	var spd = _spd;
	var dir = _dir;
	var step_incremented_spd = 0;
	var step_spd = 0;
	var step_size = 6;
	
	var return_angle = undefined;
	
	while(step_incremented_spd < spd) { // increment for xtarg and ytarg
		step_spd = step_size;
		step_incremented_spd += step_spd; 
		if (step_incremented_spd > spd) {
			step_spd = spd - (step_incremented_spd - step_size)
			step_incremented_spd = spd; 
		} // finish initializing increment variables
		
		var xtarg = x+lengthdir_x(step_spd,dir);
		var ytarg = y+lengthdir_y(step_spd,dir);
 
		if place_free(xtarg,ytarg) {
		    x = xtarg;
		    y = ytarg;
			return return_angle;
		}
		else {
			//var angle_average_total = 0;
			//var angle_average_divisor = 0;
	
		    var sweep_interval = 10;
		    for ( var angle = sweep_interval; angle <= 80; angle += sweep_interval) {
		        for ( var multiplier = -1; multiplier <= 1; multiplier += 2) {      
		            var angle_to_check = dir+angle*multiplier;
		            xtarg = x+lengthdir_x(step_spd, angle_to_check);
		            ytarg = y+lengthdir_y(step_spd, angle_to_check);     
		            if place_free(xtarg,ytarg) {
		                x = xtarg;
		                y = ytarg; 
						
					//	return_angle = angle_average_total / angle_average_divisor;
						//show_debug_message("not free at angle " + string(angle_to_check));
						
		                //exit;      
						
						multiplier = 2; 
						angle = 90;
		            }   else {
						//angle_average_total += angle_to_check;
						//angle_average_divisor += 1;
					}
		        }
		    }
		}
		return return_angle;

	}

}
