/// @description 

enum Dir8 {
	RIGHT = 0,
	UP_RIGHT = 1,
	UP = 2,
	UP_LEFT = 3,
	LEFT = 4,
	DOWN_LEFT = 5,
	DOWN = 6,
	DOWN_RIGHT = 7
}

spawn_room = room1;
player_active = true;

collectable_count = 0;

room_goto(intro_room);