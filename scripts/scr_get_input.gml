/// scr_get_input

right_key = keyboard_check(vk_right);
left_key = keyboard_check(vk_left);
up_key = keyboard_check(vk_up);
down_key = keyboard_check(vk_down);

if (keyboard_check(vk_escape)) {
    game_end();
}

if (keyboard_check_pressed(ord("R"))) {
    game_restart();
}

if (keyboard_check_pressed(ord("F"))) {
    if (window_get_fullscreen() == true) {
        window_set_fullscreen(false); 
    } else {
        window_set_fullscreen(true);
    }
}

if mouse_check_button_pressed(mb_left) {
    window_set_fullscreen(false);
}

if (distance_to_object(obj_computer_fr) <= 4) {
    with obj_computer_fr {
        if (keyboard_check_pressed(ord("X"))) {
            audio_play_sound(snd_computer,1,0);
            scr_text("Hello World!#How are you?#This is some test text.#This needs some work.", 0.25,view_xview + 30,view_xview + 30);
        }
    }
}

if (distance_to_object(obj_pod) <= 4) {
    with obj_pod {
        if (keyboard_check_pressed(ord("X"))) {
            audio_play_sound(snd_pod,1,0);
        }
    }
}
