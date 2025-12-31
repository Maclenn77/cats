
if (state == 0) {
    sprite_index = spr_cat_sleep;
	mask_index = spr_cat_walk;
}
else if (state == 1 && !keyboard_check(vk_anykey)) 
&& (!is_jumping) {
    sprite_index = spr_cat_idle;
	if (stamina < 100)
	{
		stamina += 0.015
	}
}

if keyboard_check(vk_right) && (state = 1)
{
	facing = 1;
	run(agility);
	image_xscale = facing;
	x += facing * agility;
}

if keyboard_check(vk_left) && (state = 1)
{
	facing = -1;
	run(agility);
	image_xscale = facing;
	x += facing * agility;
}

if keyboard_check_pressed(ord("A")) && (stamina > 0)
{
	sprite_index = spr_cat_attack;
	x += facing * 0.8;
	stamina -= 3
	if (stamina < 0)
	{
		stamina = 0;
	}
}


if (place_meeting(x, y+2, obj_floor))
{
	move_y = 0;
	if (keyboard_check_pressed(vk_space)) {
		// move_y += -jump_speed;
		sprite_index = spr_cat_jump;
		
	}
		
}
else if (move_y < 10) move_y += 1;


move_and_collide(move_x, move_y, obj_floor);

