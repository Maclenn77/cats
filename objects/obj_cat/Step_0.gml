// Input

key_right = keyboard_check(vk_right);
key_left = keyboard_check(vk_left);
key_up = keyboard_check(vk_up);
key_down = keyboard_check(vk_down);

is_grounded = place_meeting(x, y + 1, obj_floor)

// Direction

var move = (key_right - key_left) * agility;

// Sprites

if (move != 0) {
	
	run(agility);
	image_xscale = (move > 0) ? 1 : -1;
}

// Free the cat if stuck in a wall
if (place_meeting(x, y, obj_floor)) {
    // Try to push up
    var push_dist = 0;
    while (place_meeting(x, y, obj_floor) && push_dist < 16) {
        y -= 1;
        push_dist++;
    }
}

if (state == 0) {
    sprite_index = spr_cat_sleep;
	mask_index = spr_cat_walk;
}
else if (state == 1) && (move = 0) {
    sprite_index = spr_cat_idle;
	if (stamina < 100)
	{
		stamina += 0.015
	}
}
/*
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
*/
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

// Collision check horizontal

if (place_meeting(x + move, y, obj_floor)) {
	while !place_meeting(x + sign(move), y, obj_floor) {
		x += sign(move)
	}
	move = 0;
}

x += move;

// Collisions vertical

vspeed += gravity; 

if (place_meeting(x, y + vspeed, obj_floor)) {
	while !place_meeting(x, y + sign(vspeed), obj_floor) {
		y += sign(vspeed)
	}
	
	vspeed = 0; 
/*	if (keyboard_check_pressed(vk_space)) {
		move_y += -jump_speed;
		sprite_index = spr_cat_jump;
		
	} */
	
		
}

y += vspeed;
/*else if (move_y < 10) move_y += 1;*/


move_and_collide(move_x, move_y, obj_floor);


// Jumping action
if (is_grounded && key_up) {
	sprite_index = spr_cat_jump;
	vspeed -= jump_height
}

y += vspeed;

