jump_threshold = 24;

if (!is_charging) {
    is_charging = true;
    sprite_index = spr_cat_hold_pounce;
    key_hold_timer = 0;
} else if (is_charging == true) {
	key_hold_timer += 1;
}
