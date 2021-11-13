/// @description 
var interact_pressed = keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));

if (instance_exists(par_player)){
	
	if (open && place_meeting(x, y, par_player)) {
		game.interact_prompt = true;
		
		if (interact_pressed) {
			show_debug_message("interacting");
			
			if (is_array(action)) {
				action[action_id]();
			} else {
				action();
			}
		}
	}
}