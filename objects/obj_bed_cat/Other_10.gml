sprite_index = spr_cat_bed;
alarm[0] = 36;

if (instance_exists(obj_cat)) {
	cat_instance = obj_cat.id
    with(obj_cat) {
		state = 0;
		visible = false;
        stamina = 100;  // Restore stamina
    }

}

