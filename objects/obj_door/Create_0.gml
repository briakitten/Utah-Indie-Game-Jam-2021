/// @description 

index = 0;

threshold = 2;

inst_collision = instance_create_layer(x, y, "Collision", par_collision);
inst_collision.image_yscale = 0.875;
inst_collision.image_xscale = 4;
inst_collision.y += 48;

frame_timer = new Frame_Timer(60);