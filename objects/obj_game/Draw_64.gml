draw_text(10, 10, "stamina: " + string(round(obj_cat.stamina)))

if (variable_instance_exists(obj_cat.id, "jump_threshold") && variable_instance_exists(obj_cat.id, "jump_threshold")) {
draw_text(10, 110, string(obj_cat.jump_threshold));
draw_text(10, 210, string(obj_cat.key_hold_timer));
draw_text(10, 310, "finish loop");
}