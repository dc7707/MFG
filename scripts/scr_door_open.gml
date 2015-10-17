///scr_door_open()
//door_angle = image_angle;
if (instance_exists(obj_proximity)) {
    nearest_prox = instance_nearest(x,y,obj_proximity);
    if (distance_to_object(nearest_prox) <= 2) {myprox = nearest_prox} //else { myprox = noone }
}






/*
if (distance_to_object(obj_player) <= 20) {
    //image_speed = .2;
    
    if (image_index >= image_number -1) {
        image_speed = 0;
        image_index = image_number -1;
        //image_index = image_number -1;
        instance_destroy();
        mydoor_open = instance_create(myprox.x,myprox.y,obj_door_open)
        //mydoor_open.direction = door_angle;
        //mydoor = noone;
        with mydoor_open {image_index = image_number -1}
    } else { 
        image_speed = .2;
    } 
} else {
    if (image_index > 0) {
            image_speed = -.2
    } else {
        image_speed = 0;
        image_index = 0;
    }
}

*/
