/// @function Frame_Timer(_threshold)
/// @param _threshold [real]

function Frame_Timer(_threshold) constructor {
	index = 0;
	threshold = _threshold;
	
	/// @function update()
	update = function() {
		if (index > threshold) {
			index = 0;
			return true;
		} else {
			index += 60 / room_speed;
			//index++;
			return false;
		}
	}
	
	/// @function get_frame(animation_frame_length)
	/// @param animation_frame_length [real]
	get_frame = function(animation_frame_length) {
		frame = floor( (index / threshold) * animation_frame_length);
		if (frame >= animation_frame_length) {
			frame = animation_frame_length - 1;
		}
		return frame;
	}
}