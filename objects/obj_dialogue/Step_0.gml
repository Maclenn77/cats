// In obj_dialogue Step Event
if (keyboard_check_pressed(ord("Z"))) {
    response_yes = true;
    show_dialogue = false;
    
    // This checks if the callback_object still exists
    if (instance_exists(callback_object)) {
        with(callback_object) {  // ← Switch context to the bed
            event_user(0);        // ← Trigger the bed's User Event 0
        }
    }
}