/// @description 
if (frame_timer.update()) {
	room_goto(game.spawn_room);
	instance_destroy(self);
} else {
	alpha = frame_timer.index / frame_timer.threshold;
}