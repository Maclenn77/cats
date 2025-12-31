if (show_dialogue) {
    // Get center of screen
    var gui_w = display_get_gui_width();
    var gui_h = display_get_gui_height();
    
    var box_x = (gui_w - dialogue_width) / 2;
    var box_y = gui_h - dialogue_height - 50;
    
    // Draw semi-transparent background
    draw_set_alpha(0.8);
    draw_set_color(c_black);
    draw_rectangle(box_x, box_y, box_x + dialogue_width, box_y + dialogue_height, false);
    
    // Draw border
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_rectangle(box_x, box_y, box_x + dialogue_width, box_y + dialogue_height, true);
    
    // Draw text
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    draw_text_ext(box_x + dialogue_width/2, box_y + padding, text, 16, dialogue_width - padding*2);
    
    // Draw options
    draw_set_halign(fa_left);
    var option_y = box_y + dialogue_height - 25;
    draw_text(box_x + 20, option_y, "[Z] Yes");
    
    draw_set_alpha(1);
}