if (key_hold_timer >= jump_threshold && is_charging) {

  is_jumping = true;
  key_hold_timer = 0;
  sprite_index = spr_cat_pounce;
  image_speed = 1;
  hspeed = 16;
  x += facing * (agility * 2);
 }
 