/// @description 
if (frame_timer.update()) {
	instance_destroy(self);
} else {
	alpha = 1 - frame_timer.index / frame_timer.threshold;
}