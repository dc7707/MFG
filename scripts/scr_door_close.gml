///scr_door_close()
//door_angle = image_angle;
if (instance_exists(obj_proximity)) {
    nearest_prox = instance_nearest(x,y,obj_proximity);
    if (distance_to_object(nearest_prox) <= 2) {myprox = nearest_prox} else { myprox = noone }
}

if (image_index + image_speed >= image_number -1) {
    instance_destroy();
    mydoor = instance_create(nearest_prox.x, nearest_prox.y, obj_door)
//    mydoor.image_angle = door_angle;
    with mydoor {
        image_index = image_number -1
        if (image_index + image_speed >=  image_number -1) {
            image_index = image_number -1;
            image_speed = -.2;
        } 
        
        if (image_index + image_speed <= 0) {
            image_speed = 0;
            image_index = 0;            
        }
    }
}


