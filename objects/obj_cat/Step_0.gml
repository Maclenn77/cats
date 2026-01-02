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
	image_xscale = sign(move);
}

if (state == 0) {
    sprite_index = spr_cat_sleep;
}
else if (state == 1) && (move = 0) {
    sprite_index = spr_cat_idle;
	if (stamina < 100)
	{
		stamina += 0.015
	}
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
		
}

y += vspeed;

move_and_collide(move_x, move_y, obj_floor);


// Jumping action
if (is_grounded && key_up) {
	sprite_index = spr_cat_jump;
	vspeed -= jump_height
}

y += vspeed;

// Free the cat if stuck in a wall
if (place_meeting(x, y, obj_floor)) {
    var freed = false;
    
    // Try all four directions, starting with the shortest distances
    var directions = [
        {dx: 0, dy: -1},  // up
        {dx: 0, dy: 1},   // down
        {dx: -1, dy: 0},  // left
        {dx: 1, dy: 0}    // right
    ];
    
    for (var i = 0; i < array_length(directions); i++) {
        var push_dist = 0;
        var temp_x = x;
        var temp_y = y;
        
        while (place_meeting(temp_x, temp_y, obj_floor) && push_dist < 16) {
            temp_x += directions[i].dx;
            temp_y += directions[i].dy;
            push_dist++;
        }
        
        // If we found a free spot, move there
        if (!place_meeting(temp_x, temp_y, obj_floor)) {
            x = temp_x;
            y = temp_y;
            freed = true;
            break;
        }
    }
}

