// Alternative Step Event using collision
if (place_meeting(x, y, obj_cat)) {
    can_interact = true;
    
    if (!instance_exists(obj_dialogue)) {
        dialogue_obj = instance_create_depth(0, 0, -1000, obj_dialogue);
        dialogue_obj.text = "Would you like to take a nap?";
        dialogue_obj.show_dialogue = true;
        dialogue_obj.callback_object = id;
    }
} else {
    can_interact = false;
    
    if (instance_exists(obj_dialogue)) {
		dialogue_obj = obj_dialogue.id;
        dialogue_obj.show_dialogue = false;
        instance_destroy(dialogue_obj);
    }
}
